# 🧬 Spécifications Matérielles : PCBOX PCB-T106

[🇬🇧 Read this in English](HARDWARE_EN.md) | [🇫🇷 Lire en Français](HARDWARE.md)

L'ADN complet de la tablette PCBOX PCB-T106 S10 (Digiland) basé sur les informations extraites directement du système (`getprop`, `cpuinfo`, `dmesg`). 🔬

## 📊 Caractéristiques Principales
- 🏷️ **Marque (Build)** : PCBOX / Digiland
- 📱 **Modèle** : PCB-T106 / S10
- 🧠 **SoC (Processeur)** : Allwinner A523 (sun55iw3p1 / Saturn)
- ⚙️ **Architecture CPU** : Octa-core 64-bit (`arm64-v8a`)
- 🎮 **GPU** : Mali (Vulkan supporté)
- 🤖 **Système d'origine** : Android 14 (API Level 34)
- 🔀 **Architecture de boot** : A/B (Dynamic Partitions, Virtual A/B Compression), GKI activé

## 🔑 Propriétés de build clés (`getprop`)
```text
[ro.board.platform]: [saturn]
[ro.hardware]: [sun55iw3p1]
[ro.product.bootimage.brand]: [PCBOX]
[ro.product.bootimage.device]: [PCB-T106]
[ro.product.bootimage.model]: [S10]
[ro.build.ab_update]: [true]
[ro.virtual_ab.enabled]: [true]
[ro.treble.enabled]: [true]
```
> 💡 *Note : Cette tablette est 100% compatible Project Treble et supporte les GSIs Android 14 (ex: LineageOS 21 TrebleDroid).*

## 🧩 Partitionnement GKI
L'isolation des pilotes (Generic Kernel Image) est stricte :
- 🐧 Le noyau Linux de base (`boot.img`) peut être remplacé par un noyau compatible A523 générique.
- 📺 Les pilotes spécifiques à cette tablette (écran, Wi-Fi, tactile) résident dans `/vendor_dlkm`.
- 💾 Le ramdisk du vendeur est dans `vendor_boot`.

Ces dossiers (`reference/` dans ce dépôt) contiennent les rapports matériels complets pour la rétro-ingénierie 🕵️‍♂️ :
- 📋 `t106-dmesg.txt` : Logs du noyau au démarrage
- 🗃️ `t106-lsmod.txt` : Liste des modules/pilotes chargés
- 👆 `t106-input-devices.txt` : Références de l'écran tactile
