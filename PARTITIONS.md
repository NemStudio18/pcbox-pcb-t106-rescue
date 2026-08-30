# Table des Partitions (PCBOX PCB-T106 / Allwinner A523)

Ce tableau référence les 28 partitions présentes dans la puce eMMC de la tablette.
La table a été lue via l'outil FEL `emmc-tool.sh`. L'appareil utilise une architecture de slots A/B.

| # | Nom de la Partition | Taille | Rôle / Description | Priorité de Sauvegarde |
|---|---|---|---|---|
| 1 | `bootloader_a` | 32 MB | Bootloader primaire (U-Boot pour Allwinner) | 🔴 Critique |
| 2 | `bootloader_b` | 32 MB | Bootloader secondaire | 🔴 Critique |
| 3 | `env_a` | 256 KB | Variables d'environnement de boot | 🟡 Utile |
| 4 | `env_b` | 256 KB | Variables d'environnement (secours) | 🟡 Utile |
| 5 | `boot_a` | 64 MB | Noyau Linux + Recovery ramdisk (Android 14) | 🔴 Critique |
| 6 | `boot_b` | 64 MB | Noyau Linux de secours | 🔴 Critique |
| 7 | `vendor_boot_a` | 32 MB | Ramdisk fournisseur (pilotes early init) | 🔴 Critique |
| 8 | `vendor_boot_b` | 32 MB | Ramdisk fournisseur secondaire | 🔴 Critique |
| 9 | `init_boot_a` | 8 MB | Ramdisk d'initialisation générique (AOSP) | 🔴 Critique |
| 10 | `init_boot_b` | 8 MB | Ramdisk d'initialisation secondaire | 🔴 Critique |
| 11 | `super` | 3.5 GB | Partition dynamique contenant system, vendor, product | 🔴 Critique (Volumineux) |
| 12 | `misc` | 16 MB | Flags de boot, A/B slot actif, wipe requests | 🟠 Important |
| 13 | `vbmeta_a` | 128 KB | Android Verified Boot (AVB) - Signatures globales | 🔴 Critique |
| 14 | `vbmeta_b` | 128 KB | Android Verified Boot secondaire | 🔴 Critique |
| 15 | `vbmeta_system_a` | 64 KB | Signatures AVB de la partition system | 🟠 Important |
| 16 | `vbmeta_system_b` | 64 KB | Signatures AVB system secondaire | 🟠 Important |
| 17 | `vbmeta_vendor_a` | 64 KB | Signatures AVB de la partition vendor | 🟠 Important |
| 18 | `vbmeta_vendor_b` | 64 KB | Signatures AVB vendor secondaire | 🟠 Important |
| 19 | `frp` | 512 KB | Factory Reset Protection (Bloque le device au compte Google) | 🟡 Utile |
| 20 | `empty` | 15 MB | Espace non alloué/réservé | ⚪ Ignorer |
| 21 | `metadata` | 16 MB | Clés de chiffrement userdata, stats de boot | 🟡 Utile |
| 22 | `treadahead` | 96 MB | Cache d'optimisation de lecture | ⚪ Ignorer |
| 23 | `private` | 16 MB | Stockage protégé, calibration matérielle possible | 🟠 Important |
| 24 | `dtbo_a` | 2 MB | Device Tree Blob Overlay (Configuration matérielle) | 🔴 Critique |
| 25 | `dtbo_b` | 2 MB | Device Tree secondaire | 🔴 Critique |
| 26 | `media_data` | 16 MB | Fichiers DRM / certificats médias | 🟡 Utile |
| 27 | `pstore` | 32 MB | Logs de crash kernel (Ramoops) | ⚪ Ignorer |
| 28 | `userdata` | ~54 GB | Données utilisateur (Photos, Apps, etc.) | ⚪ Ignorer (Personnel) |

> **Attention :** Sur ce modèle spécifique, les partitions de calibration MediaTek classiques (`persist`, `nvram`, `nvdata`, `proinfo`) n'existent pas. La calibration est intégrée à `private` ou `misc`. Ne perdez jamais ces partitions.
