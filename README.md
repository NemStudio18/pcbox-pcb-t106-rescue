---
permalink: /fr/
---
# 🛠️ PCBOX PCB-T106 S10 (Allwinner A523) — Rescue & Unbrick Pack

[🇬🇧 Read this in English](README_EN.md)

> **Dépôt communautaire de sauvegarde, restauration et unbrick pour la tablette PCBOX PCB-T106 S10 (Digiland MID1058).**

---

## 📌 Présentation

Ce dépôt rassemble les ressources techniques, les dumps de partitions et la documentation nécessaires pour réparer ou flasher la tablette **PCBOX PCB-T106 S10** (vendue sous diverses marques génériques comme *Digiland*).

Ce projet est né suite à la résolution d'un **hard brick** (corruption du boot sur architecture A/B) résolu via l'extraction/injection directe en **mode matériel FEL** (en combinant le noyau de la Teclast P30T).

---

## 🚀 Pourquoi ce projet ?

Les tablettes "noname" ou sous-marque fournissent très rarement des firmwares officiels (`.img` PhoenixSuit/LiveSuit). En cas de mauvaise manipulation (root, tentative d'installation de GSI, fausse commande), la tablette devient inutilisable sans dump d'usine.

**Ce pack de secours contient :**

* 📁 **Dumps d'usine réels :** Partitions critiques d'origine (`boot_a`, `vendor_boot`, `dtbo`, `vbmeta`, table GPT).
* 📦 **Partition `super.img` d'origine :** Système Android complet compressé (disponible dans la section [Releases](../../releases)).
* ⚡ **Guides d'unbrick étape par étape :** Injections en mode matériel FEL quand l'écran reste noir.
* 🔓 **Guides de personnalisation :** Instructions pour déverrouiller le bootloader et obtenir les droits Root via Magisk.
* 📜 **Scripts d'automatisation :** Outils de dump complet via ADB Root ou mode FEL.

---

## 📖 Sommaire de la documentation

* 🔌 **[Comment entrer en Mode FEL](docs/FEL_MODE.md)** — Procédure matérielle pour forcer la puce Allwinner à communiquer via USB.
* 🚨 **[Guide d'Unbrick (Hard-Brick)](docs/DEBRICK_GUIDE.md)** — Guide étape par étape pour ressusciter une tablette complètement inactive.
* 🔓 **[Déverrouillage Bootloader & Root Magisk](docs/BOOTLOADER_ROOT.md)** — Comment libérer la tablette et obtenir l'accès root.
* 🧬 **[Matériel & Spécifications](docs/HARDWARE.md)** — Empreinte matérielle brute (`dmesg`, `lsmod`, `getprop`, détails SoC).
* 💾 **[Structure des Partitions](docs/PARTITIONS.md)** — Table complète des 28 partitions eMMC (adresses LBA, rôles et tailles).
* 🔄 **[Compatibilité Firmwares](docs/COMPATIBILITY.md)** — Retours d'expériences sur les firmwares compatibles (ex: *Teclast P30T*).

---

## 🗂️ Structure du Dépôt

```text
├── docs/                   # Documentation technique détaillée (Guides, Tutos)
├── dumps/                  # Images brutes des partitions système (< 100 Mo)
│   ├── boot_a.img          # Partition de démarrage (Noyau)
│   └── gpt-raw.img         # Table de partitionnement brute
├── reference/              # Logs système bruts (dmesg, lsmod, getprop, cpuinfo)
└── scripts/                # Scripts d'automatisation
    ├── dump_all_adb.sh     # Dump complet via ADB (Root requis)
    ├── dump_all_fel.sh     # Dump complet via le mode FEL
    └── restore_boot.sh     # Restauration d'urgence via FEL
```

> ⚠️ **Note concernant `super.img` (Système complet) :**
> En raison de sa taille (~3.5 Go), l'image brute de la partition `super` est disponible sous forme d'archive compressée (`super.img.zst`) directement sur la **[page des Releases](../../releases/latest)**.

---

## 🛠️ Outils Requis

* **Linux (recommandé) ou Windows** avec les pilotes USB Allwinner.
* **[sunxi-tools](https://github.com/linux-sunxi/sunxi-tools)** (pour les opérations en mode FEL).
* **ADB & Fastboot** (`android-tools`).
* **zstd** (pour décompresser l'image `super.img.zst`).

---

## ⚠️ Avertissement (Disclaimer)

*Les fichiers et procédures partagés ici sont fournis à des fins d'entraide et de préservation matérielle. L'auteur et les contributeurs déclinent toute responsabilité en cas de dommage causé à votre appareil. Veillez à sauvegarder vos propres partitions uniques (`persist`, `proinfo`, `nvram`) si votre tablette est encore fonctionnelle afin de ne pas perdre vos adresses MAC et numéros de série d'origine.*
