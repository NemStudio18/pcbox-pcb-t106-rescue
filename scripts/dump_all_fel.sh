#!/bin/bash
# =============================================================================
# PCBOX PCB-T106 — Script de dump complet via FEL/emmc-tool
# Usage : bash dump_all.sh
# =============================================================================

TOOLS_DIR="/home/max/Bureau/rom android nemdroid/rescue_xfel/A523-root/tools"
OUT_DIR="/home/max/Bureau/rom android nemdroid/dumps/pcb-t106-20240830"

cd "$TOOLS_DIR" || exit 1

echo "=============================="
echo " PCB-T106 — DUMP COMPLET"
echo " Sortie : $OUT_DIR"
echo "=============================="

# Vérification connexion FEL
if ! xfel version &>/dev/null; then
    echo "❌ Tablette non détectée en mode FEL !"
    echo "   → Éteins la tablette, maintiens Volume Haut, branche USB, appuie 15x Power"
    exit 1
fi
echo "✅ Tablette détectée en mode FEL"
echo ""

dump_partition() {
    local name="$1"
    local outfile="$OUT_DIR/${name}.img"
    echo "⏳ Dump de '$name'..."
    if ./emmc-tool.sh dump "$name" "$outfile"; then
        local size
        size=$(du -sh "$outfile" | cut -f1)
        echo "✅ $name → $outfile ($size)"
    else
        echo "⚠️  SKIP : '$name' introuvable ou erreur"
    fi
}

# ── PARTITIONS BOOTLOADER ─────────────────────────────────────────
echo "=== [1/7] Bootloaders ==="
dump_partition bootloader_a
dump_partition bootloader_b
dump_partition env_a
dump_partition env_b

# ── PARTITIONS NOYAU ─────────────────────────────────────────────
echo ""
echo "=== [2/7] Noyaux (boot + vendor_boot + init_boot) ==="
dump_partition boot_a
dump_partition boot_b
dump_partition vendor_boot_a
dump_partition vendor_boot_b
dump_partition init_boot_a
dump_partition init_boot_b

# ── DEVICE TREE ──────────────────────────────────────────────────
echo ""
echo "=== [3/7] Device Tree Overlays ==="
dump_partition dtbo_a
dump_partition dtbo_b

# ── VBMETA (vérification intégrité) ─────────────────────────────
echo ""
echo "=== [4/7] VBMeta ==="
dump_partition vbmeta_a
dump_partition vbmeta_b
dump_partition vbmeta_system_a
dump_partition vbmeta_system_b
dump_partition vbmeta_vendor_a
dump_partition vbmeta_vendor_b

# ── CALIBRATION & IDENTIFIANTS UNIQUES ──────────────────────────
echo ""
echo "=== [5/7] Calibration & Identifiants uniques ==="
for part in persist proinfo productinfo nvram nvdata frp misc private secure_storage config sec; do
    dump_partition "$part"
done

# ── MÉTADONNÉES SYSTÈME ──────────────────────────────────────────
echo ""
echo "=== [6/7] Métadonnées système ==="
dump_partition metadata
dump_partition pstore
dump_partition media_data
dump_partition treadahead
dump_partition empty

# GPT brute (64 premiers secteurs)
echo ""
echo "⏳ Dump GPT brut (64 secteurs)..."
echo "123456789" | sudo -S dd if=/dev/block/mmcblk0 bs=512 count=64 of="$OUT_DIR/gpt-raw.img" 2>/dev/null \
    || ./emmc-tool.sh dump mmcblk0 "$OUT_DIR/gpt-sector0.img" 2>/dev/null \
    || echo "⚠️  GPT brut : utiliser emmc-tool manuellement"

# ── SUPER (GROS) ─────────────────────────────────────────────────
echo ""
echo "=== [7/7] super.img (3.5 Go — LONGUE OPÉRATION ~2h) ==="
echo "⏳ Démarrage du dump de super..."
dump_partition super

echo ""
echo "=============================="
echo " ✅ DUMP TERMINÉ"
echo "=============================="
echo ""
echo "Résumé des fichiers :"
ls -lh "$OUT_DIR"/*.img 2>/dev/null
echo ""
echo "⏳ Compression de super.img en cours (zstd)..."
if [ -f "$OUT_DIR/super.img" ]; then
    zstd --ultra -22 --threads=0 "$OUT_DIR/super.img" -o "$OUT_DIR/super.img.zst" \
        && echo "✅ super.img.zst créé" \
        && rm "$OUT_DIR/super.img" \
        && echo "🗑️  super.img original supprimé (zst conservé)"
fi

echo ""
echo "Taille totale du dossier de dumps :"
du -sh "$OUT_DIR"
