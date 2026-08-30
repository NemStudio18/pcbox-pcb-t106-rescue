# 🔓 Unlock the Bootloader and Root with Magisk

[🇬🇧 Read this in English](BOOTLOADER_ROOT_EN.md) | [🇫🇷 Lire en Français](BOOTLOADER_ROOT.md)

This guide explains how to unlock the bootloader of your PCBOX PCB-T106 S10 tablet (Allwinner A523) and how to gain administrative rights (Root) using Magisk. 🪄

> ⚠️ **WARNING:** Unlocking the bootloader will wipe **ALL** data on your tablet (Factory Reset). Please backup your important data before proceeding. 💾

---

## 🔓 Part 1: Unlocking the Bootloader

### 1. ⚙️ Enable Developer Options
1. On the tablet, go to **Settings** > **About tablet**.
2. Tap rapidly 7 times on the **Build number** until you see "You are now a developer".
3. Go back and navigate to **System** > **Developer options**.
4. Enable **OEM unlocking** and **USB debugging**.

### 2. 🔌 Boot into Fastboot Mode
Connect the tablet to your PC via USB. Open a terminal on your PC (Linux/Windows) and type:
```bash
adb reboot bootloader
```
The tablet will reboot to a black screen with a small "FASTBOOT MODE" text. 🖥️

### 3. 🔑 Unlock
In your PC terminal, type:
```bash
fastboot flashing unlock
```
*(If this command fails, try `fastboot oem unlock`)*.

On the tablet screen, a prompt will ask you to confirm the unlock. Use the **Volume** keys to select "Unlock the bootloader" and confirm with the **Power** button.
The tablet will wipe its data and reboot (the first boot will take longer). ⏳

---

## 🦸 Part 2: Root the Tablet with Magisk

Since we do not have TWRP, we will use the boot image patching method (`boot.img`). 🐧

### 1. 📦 Prepare the Boot Image
1. Get the `boot_a.img` file located in the `dumps/` folder of this GitHub repository.
2. Copy this `boot_a.img` file to the internal storage of your tablet (e.g., in the *Download* folder).
```bash
adb push dumps/boot_a.img /sdcard/Download/
```

### 2. 💉 Patch the Image with Magisk
1. Download and install the official **[Magisk Manager](https://github.com/topjohnwu/Magisk/releases)** on your tablet (`.apk` file).
2. Open Magisk. In the top "Magisk" card, tap on **Install**.
3. Choose **Select and Patch a File**.
4. Use the file explorer to locate the `boot_a.img` you just copied.
5. Tap on **LET'S GO**. Magisk will patch the file and create a new one named `magisk_patched-XXX.img` in your *Download* folder. ✨

### 3. 📥 Retrieve the Patched Image
Transfer the patched image from the tablet back to your PC:
```bash
adb pull /sdcard/Download/magisk_patched-XXX.img .
```
*(Replace `XXX` with the randomly generated characters by Magisk)*.

### 4. ⚡ Flash the Rooted Image
Reboot the tablet into Fastboot mode:
```bash
adb reboot bootloader
```

Flash the patched image to the boot partition:
```bash
fastboot flash boot magisk_patched-XXX.img
```
*(Tip: Since it is an A/B architecture, fastboot will automatically flash to the active slot, usually `boot_a`)*.

Reboot the tablet:
```bash
fastboot reboot
```

🎉 **Congratulations!** Open the Magisk app on your tablet. It might ask for an additional reboot to finalize the setup. You are now Rooted! 👑
