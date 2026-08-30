# 🚨 Hard Brick Debrick Guide

[🇬🇧 Read this in English](DEBRICK_GUIDE_EN.md) | [🇫🇷 Lire en Français](DEBRICK_GUIDE.md)

If your PCBOX PCB-T106 tablet remains stuck on a black screen, does not turn on at all, or remains frozen indefinitely on the boot logo without being able to access Recovery or Fastboot mode, you are facing a "hard brick" 🧱.

Thanks to the Allwinner A523 processor architecture, the tablet is recoverable via the hardware **FEL Mode** 🛠️.

## 📋 Prerequisites
1. 🐧 A computer running Linux (Ubuntu/Debian recommended).
2. 📜 The `emmc-tool.sh` script (and the `xfel` binaries compiled for A523) located in the `scripts/` folder.
3. 💾 The original image files (dumps) located in the `dumps/` folder.
4. 🔌 A good quality USB data cable.

## 🛠️ Step 1: Enter FEL Mode
Follow the complete guide: [How to enter FEL mode](FEL_MODE_EN.md).
Verify that the tablet is detected with the `lsusb` command (it must display `1f3a:efe8`) ✅.

## 💻 Step 2: Prepare the flashing tool
Open a terminal and navigate to the folder containing the script:
```bash
cd pcbox-pcb-t106-rescue/scripts
```

Verify that the tool communicates properly with the tablet:
```bash
sudo xfel version
```
*If this returns an error, check your USB cable and repeat Step 1 🔄.*

## ⚡ Step 3: Flash the corrupted partition

### 🅰️ Scenario A: You corrupted the `boot` partition (Kernel/Recovery)
This is the most common case (for example after flashing a bad Magisk or GSI). On Android 14 GKI, the Recovery no longer has a dedicated partition, it is included in `boot` 🧠.

Flash the working kernel from our dumps (or the Teclast P30T one):
```bash
# For Slot A:
./emmc-tool.sh flash boot_a ../dumps/boot_a.img
```
*(Flashing 64 MB in FEL mode takes about 1h to 1h30, as writing is done in 32 KB blocks. Be patient ⏳).*

### 🅱️ Scenario B: The partition table (GPT) is destroyed
If the computer no longer recognizes the tablet's partitions at all 💥.
```bash
./emmc-tool.sh flash mmcblk0 ../dumps/gpt-raw.img
```

### 🆎 Scenario C: The entire system is destroyed
You will need to restore the `super` partition (which contains system, vendor, and product) 🌍.
1. ⬇️ Download `super.img.zst` from the GitHub "Releases" of this repository.
2. 📦 Decompress it: `zstd -d super.img.zst -o super.img`
3. 🚀 Flash it via FEL (Warning, this can take hours 🕐):
```bash
./emmc-tool.sh flash super super.img
```

## 🔄 Step 4: Reboot
Once the flash is 100% complete, unplug the USB cable 🔌.
Hold the Power button for at least 10 seconds to force a reboot.
The first boot can be long (3-4 minutes). Leave the tablet alone ☕.
