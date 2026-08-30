# 🔓 Déverrouiller le Bootloader et Rooter avec Magisk

[🇬🇧 Read this in English](BOOTLOADER_ROOT_EN.md) | [🇫🇷 Lire en Français](BOOTLOADER_ROOT.md)

Ce guide vous explique comment déverrouiller le chargeur d'amorçage (Bootloader) de votre tablette PCBOX PCB-T106 S10 (Allwinner A523) et comment obtenir les droits administrateur (Root) à l'aide de Magisk. 🪄

> ⚠️ **ATTENTION :** Déverrouiller le bootloader effacera **TOUTES** les données de la tablette (Factory Reset). Sauvegardez vos données importantes avant de commencer. 💾

---

## 🔓 Partie 1 : Déverrouiller le Bootloader

### 1. ⚙️ Activer les options pour les développeurs
1. Sur la tablette, allez dans **Paramètres** > **À propos de la tablette**.
2. Tapotez 7 fois rapidement sur **Numéro de build** jusqu'à voir "Vous êtes désormais un développeur".
3. Revenez en arrière et allez dans **Système** > **Options pour les développeurs**.
4. Cochez **Déverrouillage OEM** (OEM Unlocking) et **Débogage USB** (USB Debugging).

### 2. 🔌 Passer en mode Fastboot
Branchez la tablette à votre PC via USB. Sur votre PC (Linux/Windows), ouvrez un terminal et tapez :
```bash
adb reboot bootloader
```
La tablette va redémarrer sur un écran noir avec un petit texte "FASTBOOT MODE". 🖥️

### 3. 🔑 Déverrouiller (Unlock)
Dans le terminal de votre PC, tapez :
```bash
fastboot flashing unlock
```
*(Si cette commande échoue, essayez `fastboot oem unlock`)*.

Sur l'écran de la tablette, un message vous demandera de confirmer le déverrouillage. Utilisez les boutons de **Volume** pour sélectionner "Unlock the bootloader" et validez avec le bouton **Power**.
La tablette va se réinitialiser et redémarrer (le premier démarrage sera plus long). ⏳

---

## 🦸 Partie 2 : Rooter la tablette avec Magisk

Puisque nous n'avons pas de TWRP, nous allons utiliser la méthode de patch de l'image de démarrage (`boot.img`). 🐧

### 1. 📦 Préparer l'image Boot
1. Récupérez le fichier `boot_a.img` qui se trouve dans le dossier `dumps/` de ce dépôt GitHub.
2. Copiez ce fichier `boot_a.img` sur la mémoire interne de votre tablette (par exemple dans le dossier *Download*).
```bash
adb push dumps/boot_a.img /sdcard/Download/
```

### 2. 💉 Patcher l'image avec Magisk
1. Téléchargez et installez l'application officielle **[Magisk Manager](https://github.com/topjohnwu/Magisk/releases)** sur la tablette (fichier `.apk`).
2. Ouvrez Magisk. Dans la carte "Magisk" en haut, appuyez sur **Installer**.
3. Choisissez **Sélectionner et patcher un fichier**.
4. Dans l'explorateur de fichiers, allez chercher le `boot_a.img` que vous venez de copier.
5. Appuyez sur **C'EST PARTI**. Magisk va patcher le fichier et créer un nouveau fichier nommé `magisk_patched-XXX.img` dans votre dossier *Download*. ✨

### 3. 📥 Récupérer l'image patchée
Transférez l'image patchée de la tablette vers votre PC :
```bash
adb pull /sdcard/Download/magisk_patched-XXX.img .
```
*(Remplacez `XXX` par les numéros générés par Magisk)*.

### 4. ⚡ Flasher l'image rootée
Redémarrez la tablette en mode Fastboot :
```bash
adb reboot bootloader
```

Flashez l'image patchée sur la partition de boot :
```bash
fastboot flash boot magisk_patched-XXX.img
```
*(Astuce : L'architecture étant A/B, fastboot flashera automatiquement sur le slot actif, généralement `boot_a`)*.

Redémarrez la tablette :
```bash
fastboot reboot
```

🎉 **Félicitations !** Ouvrez l'application Magisk sur la tablette, elle vous demandera peut-être un redémarrage supplémentaire pour finaliser la configuration. Vous êtes désormais Rooté ! 👑
