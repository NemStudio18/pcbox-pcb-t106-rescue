# Partition Table (PCBOX PCB-T106 / Allwinner A523)

[🇫🇷 Lire en Français](PARTITIONS.md)

This table lists the 28 partitions present in the tablet's eMMC chip.
The table was read via the FEL tool `emmc-tool.sh`. The device uses an A/B slot architecture.

| # | Partition Name | Size | Role / Description | Backup Priority |
|---|---|---|---|---|
| 1 | `bootloader_a` | 32 MB | Primary bootloader (U-Boot for Allwinner) | 🔴 Critical |
| 2 | `bootloader_b` | 32 MB | Secondary bootloader | 🔴 Critical |
| 3 | `env_a` | 256 KB | Boot environment variables | 🟡 Useful |
| 4 | `env_b` | 256 KB | Secondary environment variables | 🟡 Useful |
| 5 | `boot_a` | 64 MB | Linux Kernel + Recovery ramdisk (Android 14) | 🔴 Critical |
| 6 | `boot_b` | 64 MB | Secondary Linux Kernel | 🔴 Critical |
| 7 | `vendor_boot_a` | 32 MB | Vendor ramdisk (early init drivers) | 🔴 Critical |
| 8 | `vendor_boot_b` | 32 MB | Secondary vendor ramdisk | 🔴 Critical |
| 9 | `init_boot_a` | 8 MB | Generic init ramdisk (AOSP) | 🔴 Critical |
| 10 | `init_boot_b` | 8 MB | Secondary init ramdisk | 🔴 Critical |
| 11 | `super` | 3.5 GB | Dynamic partition containing system, vendor, product | 🔴 Critical (Large) |
| 12 | `misc` | 16 MB | Boot flags, active A/B slot, wipe requests | 🟠 Important |
| 13 | `vbmeta_a` | 128 KB | Android Verified Boot (AVB) - Global signatures | 🔴 Critical |
| 14 | `vbmeta_b` | 128 KB | Secondary AVB | 🔴 Critical |
| 15 | `vbmeta_system_a` | 64 KB | AVB signatures for system partition | 🟠 Important |
| 16 | `vbmeta_system_b` | 64 KB | Secondary system AVB signatures | 🟠 Important |
| 17 | `vbmeta_vendor_a` | 64 KB | AVB signatures for vendor partition | 🟠 Important |
| 18 | `vbmeta_vendor_b` | 64 KB | Secondary vendor AVB signatures | 🟠 Important |
| 19 | `frp` | 512 KB | Factory Reset Protection (Locks device to Google account) | 🟡 Useful |
| 20 | `empty` | 15 MB | Unallocated/reserved space | ⚪ Ignore |
| 21 | `metadata` | 16 MB | userdata encryption keys, boot stats | 🟡 Useful |
| 22 | `treadahead` | 96 MB | Read optimization cache | ⚪ Ignore |
| 23 | `private` | 16 MB | Protected storage, possible hardware calibration | 🟠 Important |
| 24 | `dtbo_a` | 2 MB | Device Tree Blob Overlay (Hardware config) | 🔴 Critical |
| 25 | `dtbo_b` | 2 MB | Secondary Device Tree | 🔴 Critical |
| 26 | `media_data` | 16 MB | DRM files / media certificates | 🟡 Useful |
| 27 | `pstore` | 32 MB | Kernel crash logs (Ramoops) | ⚪ Ignore |
| 28 | `userdata` | ~54 GB | User data (Photos, Apps, etc.) | ⚪ Ignore (Personal) |

> **Warning:** On this specific model, the classic MediaTek calibration partitions (`persist`, `nvram`, `nvdata`, `proinfo`) do not exist. Calibration is integrated into `private` or `misc`. Never lose these partitions.
