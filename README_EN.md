# 🛠️ PCBOX PCB-T106 S10 (Allwinner A523) — Rescue & Debrick Pack

[🇫🇷 Lire en Français](README.md)

> **Community repository for backup, restoration, and unbricking of the PCBOX PCB-T106 S10 tablet (Digiland MID1058).**

---

## 📌 Overview

This repository gathers all the technical resources, partition dumps, and documentation needed to repair or flash the **PCBOX PCB-T106 S10** tablet (often sold under various generic brands like *Digiland*).

This project was born after recovering from a **hard brick** (boot corruption on an A/B architecture) which was solved via direct extraction/injection in **hardware FEL mode** (using a Teclast P30T kernel).

---

## 🚀 Why this project?

"Noname" or generic tablets rarely provide official firmwares (PhoenixSuit/LiveSuit `.img`). In case of a mistake (rooting, trying to install a GSI, wrong fastboot command), the tablet becomes completely unusable without a factory dump.

**This rescue pack contains:**

* 📁 **Real factory dumps:** Original critical partitions (`boot_a`, `vendor_boot`, `dtbo`, `vbmeta`, raw GPT table).
* 📦 **Original `super.img` partition:** Full Android system compressed (available in the [Releases](../../releases) section).
* ⚡ **Step-by-step unbrick guides:** Hardware FEL mode injections for when the screen remains completely black.
* 🔓 **Customization guides:** Instructions to unlock the bootloader and gain Root access via Magisk.
* 📜 **Automation scripts:** Full dump tools via Root ADB or FEL mode.

---

## 📖 Documentation Index

* 🔌 **[How to enter FEL Mode](docs/FEL_MODE_EN.md)** — Hardware procedure to force the Allwinner chip to communicate via USB.
* 🚨 **[Unbrick Guide (Hard-Brick)](docs/DEBRICK_GUIDE_EN.md)** — Step-by-step guide to resurrect a completely dead tablet.
* 🔓 **[Bootloader Unlock & Magisk Root](docs/BOOTLOADER_ROOT_EN.md)** — How to free the tablet and get root access.
* 🧬 **[Hardware & Specs](docs/HARDWARE_EN.md)** — Raw hardware footprint (`dmesg`, `lsmod`, `getprop`, SoC details).
* 💾 **[Partitions Structure](docs/PARTITIONS_EN.md)** — Complete table of all 28 eMMC partitions (LBA addresses, roles, sizes).
* 🔄 **[Firmware Compatibility](docs/COMPATIBILITY_EN.md)** — Feedback on compatible firmwares (e.g. *Teclast P30T*).

---

## 🗂️ Repository Structure

```text
├── docs/                   # Detailed technical documentation (Guides, Tutorials)
├── dumps/                  # Raw system partition images (< 100 MB)
│   ├── boot_a.img          # Boot partition (Kernel)
│   └── gpt-raw.img         # Raw partition table
├── reference/              # Raw system logs (dmesg, lsmod, getprop, cpuinfo)
└── scripts/                # Automation scripts
    ├── dump_all_adb.sh     # Full dump via ADB (Root required)
    ├── dump_all_fel.sh     # Full dump via FEL mode
    └── restore_boot.sh     # Emergency restore via FEL
```

> ⚠️ **Note regarding `super.img` (Full System):**
> Due to its massive size (~3.5 GB), the raw image of the `super` partition is available as a compressed archive (`super.img.zst`) directly on the **[Releases page](../../releases/latest)**.

---

## 🛠️ Required Tools

* **Linux (recommended) or Windows** with Allwinner USB drivers.
* **[sunxi-tools](https://github.com/linux-sunxi/sunxi-tools)** (for FEL mode operations).
* **ADB & Fastboot** (`android-tools`).
* **zstd** (to decompress the `super.img.zst` image).

---

## ⚠️ Disclaimer

*The files and procedures shared here are provided for community help and hardware preservation purposes only. The author and contributors hold no responsibility for any damage caused to your device. Please ensure you backup your own unique partitions (`persist`, `proinfo`, `nvram`) if your tablet is still functional, to avoid losing your original MAC addresses and serial numbers.*
