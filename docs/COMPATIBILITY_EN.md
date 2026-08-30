# Compatible Firmwares (Allwinner A523)

[🇫🇷 Lire en Français](COMPATIBILITY.md)

This file lists firmwares from other brands tested on the PCBOX PCB-T106 tablet.

The GKI (Generic Kernel Image) architecture of Android 14 allows for cross-flashing certain files between devices sharing the same processor (Allwinner A523), provided you do not overwrite hardware-specific drivers (`vendor_dlkm`).

## Teclast P30T (P5A1)
- **Tested version:** `Android 14.0_EEA_V1.22_20240621_SZ`
- **Kernel result (`boot.img`):** ✅ **100% WORKING**
- **Notes:** The `boot.img` file extracted from this Teclast factory firmware works perfectly on the PCBOX PCB-T106. It boots the device and properly loads the original PCBOX display and touch drivers.
- **Warning:** **NEVER** flash the Teclast `vendor_boot.img` or `super.img` to your PCBOX, or you will lose Wi-Fi, touch screen, or camera functionality. Only `boot.img` is compatible.

## Generic System Images (GSI)
The tablet supports Project Treble.
- **LineageOS 21 (Android 14) TrebleDroid**: ✅ **WORKING**
- **Required type:** `arm64_bgN` (A/B, Google Apps included, no built-in root).
- **Warning:** A GSI only replaces the `system` partition (included in `super`). You must flash the GSI image to a dynamic partition, which requires being in `fastbootd` mode (not the classic bootloader fastboot).

*If you test other kernels or firmwares, feel free to open a Pull Request to update this list.*
