# 🔌 Guide: How to enter FEL mode (Allwinner A523)

[🇬🇧 Read this in English](FEL_MODE_EN.md) | [🇫🇷 Lire en Français](FEL_MODE.md)

FEL mode is a low-level hardware emergency recovery mode integrated directly into the chip (BROM) of Allwinner processors. **This mode is unbrickable 🛡️**. Even if the internal eMMC memory is entirely erased or corrupted, FEL mode will always work!

It allows the processor to communicate directly with a PC via USB to inject code or read/write to the internal storage. 💻⚡

## 🕹️ The Procedure (Button Sequence)

On the PCBOX PCB-T106 tablet, the button combination is very precise. If it fails, unplug and start over. 🔄

1. 📴 **Tablet completely powered off.** (If it is stuck on the boot logo, hold the Power button for 15 seconds to force a hard shutdown).
2. 🔊 **Press and hold the "Volume Up" button.** (Do not release it).
3. 🔌 **Plug the USB cable** connected to your computer (the cable must support data transfer, not just charging).
4. ⚡ As soon as the cable is plugged in, **press the "Power" button very rapidly 15 times in a row**.
5. 🖐️ Release the Volume Up button.

> ⚠️ **Note:** The tablet screen MUST remain completely black. If the brand logo or battery gauge appears, the procedure failed. Unplug, wait for it to turn off, and try again.

## 🖥️ Verification on the Computer

### 🐧 On Linux (Ubuntu/Debian)
Open a terminal and type the following command:
```bash
lsusb
```
You should see a line containing this exact identifier:
`Bus XXX Device YYY: ID 1f3a:efe8 Allwinner Technology sunxi SoC OTG connector in FEL/flashing mode`

✅ **The Vendor ID `1f3a` and Product ID `efe8` are the absolute signature of FEL mode.**

### 🪟 On Windows
Open the **Device Manager**.
You should see an unknown device or one named "USB Device(VID_1f3a_PID_efe8)".
You will need to install WinUSB drivers using a tool like Zadig (https://zadig.akeo.ie/) to be able to use tools like `xfel`. 🛠️

## ⚙️ Using the `xfel` tool

Once the tablet is detected, you can use the open-source tool [xfel](https://github.com/xboot/xfel) (compiled to support the A523 processor).

To verify communication:
```bash
sudo xfel version
```
*Expected output:*
`AWUSBFEX ID=0x00189000(A523/A527/T527/MR527) dflag=0x44 dlength=0x08 scratchpad=0x00061500` 🎉

You can then use the scripts provided in the `scripts/` folder of this repository to dump or flash partitions. 🚀
