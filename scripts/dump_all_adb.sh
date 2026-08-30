#!/bin/bash
# =============================================================================
# PCBOX PCB-T106 — Dump complet via ADB root
# Beaucoup plus rapide que FEL — utilise USB ADB
# =============================================================================

DUMP_DIR="/home/max/Bureau/rom android nemdroid/dumps/pcb-t106-20240830"
mkdir -p "$DUMP_DIR"

echo "=============================="
echo " PCB-T106 — DUMP COMPLET (ADB)"
echo "=============================="

# Vérification root
if ! adb shell id 2>/dev/null | grep -q "uid=0"; then
    echo "❌ ADB non root ! Lance : adb root"
    exit 1
fi
echo "✅ ADB root confirmé"

dump_part() {
    local name="$1"
    local outfile="$DUMP_DIR/${name}.img"
    local blockdev="/dev/block/by-name/$name"
    echo -n "⏳ $name... "
    if adb shell "test -e $blockdev" 2>/dev/null; then
        adb shell "dd if=$blockdev bs=4096 2>/dev/null" > "$outfile"
        local size=$(du -sh "$outfile" 2>/dev/null | cut -f1)
        echo "✅ $size → ${name}.img"
    else
        echo "⚠️  partition '$name' introuvable, skip"
    fi
}

echo ""
echo "=== [1/6] Bootloaders ==="
dump_part bootloader_a
dump_part bootloader_b
dump_part env_a
dump_part env_b

echo ""
echo "=== [2/6] Noyaux ==="
dump_part boot_a
dump_part boot_b
dump_part vendor_boot_a
dump_part vendor_boot_b
dump_part init_boot_a
dump_part init_boot_b

echo ""
echo "=== [3/6] Device Tree & VBMeta ==="
dump_part dtbo_a
dump_part dtbo_b
dump_part vbmeta_a
dump_part vbmeta_b
dump_part vbmeta_system_a
dump_part vbmeta_system_b
dump_part vbmeta_vendor_a
dump_part vbmeta_vendor_b

echo ""
echo "=== [4/6] Calibration & Identifiants uniques ⚠️ ==="
for part in persist proinfo productinfo nvram nvdata frp misc private secure_storage config sec metadata pstore treadahead empty media_data; do
    dump_part "$part"
done

echo ""
echo "=== [5/6] super.img (3.5 Go) — LONGUE OPÉRATION ==="
echo -n "⏳ super... "
adb shell "dd if=/dev/block/by-name/super bs=4096 2>/dev/null" > "$DUMP_DIR/super.img"
echo "✅ $(du -sh "$DUMP_DIR/super.img" | cut -f1)"

echo ""
echo "=== [6/6] Compression super.img ==="
zstd --ultra -22 --threads=0 "$DUMP_DIR/super.img" -o "$DUMP_DIR/super.img.zst" \
    && echo "✅ super.img.zst créé" \
    && rm "$DUMP_DIR/super.img" \
    && echo "🗑️  super.img supprimé"

echo ""
echo "=============================="
echo " ✅ DUMP TERMINÉ"
echo "=============================="
du -sh "$DUMP_DIR"
ls -lh "$DUMP_DIR"/*.img "$DUMP_DIR"/*.zst 2>/dev/null
