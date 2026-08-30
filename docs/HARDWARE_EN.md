# 🧬 Hardware Specifications: PCBOX PCB-T106

[🇬🇧 Read this in English](HARDWARE_EN.md) | [🇫🇷 Lire en Français](HARDWARE.md)

The complete DNA of the PCBOX PCB-T106 S10 (Digiland) tablet based on information extracted directly from the system (`getprop`, `cpuinfo`, `dmesg`). 🔬

## 📊 Main Features
- 🏷️ **Brand (Build)**: PCBOX / Digiland
- 📱 **Model**: PCB-T106 / S10
- 🧠 **SoC (Processor)**: Allwinner A523 (sun55iw3p1 / Saturn)
- ⚙️ **CPU Architecture**: Octa-core 64-bit (`arm64-v8a`)
- 🎮 **GPU**: Mali (Vulkan supported)
- 🤖 **Original OS**: Android 14 (API Level 34)
- 🔀 **Boot Architecture**: A/B (Dynamic Partitions, Virtual A/B Compression), GKI enabled

## 🔑 Key Build Properties (`getprop`)
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
> 💡 *Note: This tablet is 100% Project Treble compatible and supports Android 14 GSIs (e.g., LineageOS 21 TrebleDroid).*

## 🧩 GKI Partitioning
Driver isolation (Generic Kernel Image) is strict:
- 🐧 The base Linux kernel (`boot.img`) can be replaced by a generic compatible A523 kernel.
- 📺 Drivers specific to this tablet (screen, Wi-Fi, touch) reside in `/vendor_dlkm`.
- 💾 The vendor ramdisk is in `vendor_boot`.

The folders (`reference/` in this repository) contain the full hardware reports for reverse engineering 🕵️‍♂️:
- 📋 `t106-dmesg.txt`: Kernel logs at boot
- 🗃️ `t106-lsmod.txt`: List of loaded modules/drivers
- 👆 `t106-input-devices.txt`: Touch screen references
