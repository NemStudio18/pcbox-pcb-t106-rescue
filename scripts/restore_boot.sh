#!/bin/bash
# =============================================================================
# PCBOX PCB-T106 — Restauration rapide du noyau via FEL
# =============================================================================

TOOLS_DIR="./" # Placer emmc-tool.sh et xfel dans le même dossier
BOOT_IMG="../dumps/boot_a.img"

echo "=============================="
echo " RESTAURATION BOOT_A (Noyau)"
echo "=============================="

if [ ! -f "$BOOT_IMG" ]; then
    echo "❌ Erreur : $BOOT_IMG introuvable."
    exit 1
fi

if ! xfel version &>/dev/null; then
    echo "❌ Tablette non détectée en mode FEL !"
    exit 1
fi

echo "✅ Tablette détectée. Démarrage du flash..."
./emmc-tool.sh flash boot_a "$BOOT_IMG"

echo "✅ Flash terminé. Redémarrez la tablette manuellement."
