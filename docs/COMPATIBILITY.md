# 🔄 Firmwares Compatibles (Allwinner A523)

[🇬🇧 Read this in English](COMPATIBILITY_EN.md) | [🇫🇷 Lire en Français](COMPATIBILITY.md)

Ce fichier recense les firmwares d'autres marques testés sur la tablette PCBOX PCB-T106. 📊

L'architecture GKI (Generic Kernel Image) d'Android 14 permet de croiser certains fichiers entre appareils partageant le même processeur (Allwinner A523), à condition de ne pas écraser les pilotes spécifiques au matériel (`vendor_dlkm`). 🧠

## 📱 Teclast P30T (P5A1)
- 🏷️ **Version testée :** `Android 14.0_EEA_V1.22_20240621_SZ`
- 🐧 **Résultat du noyau (`boot.img`) :** ✅ **100% FONCTIONNEL**
- 📝 **Notes :** Le fichier `boot.img` extrait de ce firmware d'usine Teclast fonctionne parfaitement sur la PCBOX PCB-T106. Il démarre l'appareil et charge correctement les pilotes d'affichage et tactiles d'origine de la PCBOX.
- ⚠️ **Attention :** Ne flashez **JAMAIS** le fichier `vendor_boot.img` ou `super.img` de Teclast sur votre PCBOX, sous peine de perdre le Wi-Fi, l'écran tactile ou la caméra. Seul le `boot.img` est compatible.

## 🌍 Generic System Images (GSI)
La tablette supporte Project Treble.
- 🤖 **LineageOS 21 (Android 14) TrebleDroid** : ✅ **FONCTIONNEL**
- 📦 **Type requis :** `arm64_bgN` (A/B, Google Apps incluses, pas de root intégré).
- ⚠️ **Attention :** Un GSI remplace uniquement la partition `system` (incluse dans `super`). Il faut flasher l'image GSI sur une partition dynamique, ce qui requiert d'être en mode `fastbootd` (et non le fastboot classique du bootloader).

*Si vous testez d'autres noyaux ou firmwares, n'hésitez pas à ouvrir une Pull Request pour mettre à jour cette liste !* ✨
