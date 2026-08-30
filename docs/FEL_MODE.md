# 🔌 Guide : Comment entrer en mode FEL (Allwinner A523)

[🇬🇧 Read this in English](FEL_MODE_EN.md) | [🇫🇷 Lire en Français](FEL_MODE.md)

Le mode FEL est un mode de récupération matériel d'urgence intégré directement dans la puce (BROM) des processeurs Allwinner. **Ce mode est impossible à corrompre (unbrickable) 🛡️**. Même si la mémoire eMMC interne est entièrement effacée ou corrompue, le mode FEL fonctionnera toujours !

Il permet au processeur de communiquer directement avec un PC via USB pour y injecter du code ou lire/écrire sur la mémoire morte. 💻⚡

## 🕹️ La manipulation (Séquence des boutons)

Sur la tablette PCBOX PCB-T106, la manipulation est très précise. Si elle échoue, débranchez et recommencez. 🔄

1. 📴 **Tablette complètement éteinte.** (Si elle est bloquée sur le logo, maintenez le bouton Power pendant 15 secondes pour forcer l'extinction).
2. 🔊 **Maintenez le bouton "Volume Haut" enfoncé.** (Ne le relâchez pas).
3. 🔌 **Branchez le câble USB** relié à votre ordinateur (le câble doit supporter le transfert de données, pas seulement la charge).
4. ⚡ Dès que le câble est branché, **appuyez très rapidement 15 fois d'affilée sur le bouton "Power"**.
5. 🖐️ Relâchez le bouton Volume Haut.

> ⚠️ **Note :** L'écran de la tablette DOIT rester complètement noir. Si le logo de la marque ou la jauge de batterie s'affiche, la manipulation a échoué. Débranchez, attendez qu'elle s'éteigne et recommencez.

## 🖥️ Vérification sur l'ordinateur

### 🐧 Sous Linux (Ubuntu/Debian)
Ouvrez un terminal et tapez la commande suivante :
```bash
lsusb
```
Vous devez voir apparaître une ligne contenant cet identifiant précis :
`Bus XXX Device YYY: ID 1f3a:efe8 Allwinner Technology sunxi SoC OTG connector in FEL/flashing mode`

✅ **Le Vendor ID `1f3a` et Product ID `efe8` sont la signature absolue du mode FEL.**

### 🪟 Sous Windows
Ouvrez le **Gestionnaire de périphériques**.
Vous devriez voir un périphérique inconnu ou nommé "USB Device(VID_1f3a_PID_efe8)".
Il faudra installer les pilotes WinUSB via un outil comme Zadig (https://zadig.akeo.ie/) pour pouvoir utiliser des outils comme `xfel`. 🛠️

## ⚙️ Utilisation avec l'outil `xfel`

Une fois la tablette détectée, vous pouvez utiliser l'outil open-source [xfel](https://github.com/xboot/xfel) (compilé pour supporter le processeur A523).

Pour vérifier la communication :
```bash
sudo xfel version
```
*Sortie attendue :*
`AWUSBFEX ID=0x00189000(A523/A527/T527/MR527) dflag=0x44 dlength=0x08 scratchpad=0x00061500` 🎉

Vous pouvez ensuite utiliser les scripts fournis dans le dossier `scripts/` de ce dépôt pour dumper ou flasher des partitions. 🚀
