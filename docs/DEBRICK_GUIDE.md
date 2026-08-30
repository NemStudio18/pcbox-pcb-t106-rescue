# Guide de Débriçage (Hard Brick)

Si votre tablette PCBOX PCB-T106 reste bloquée sur un écran noir, ne s'allume plus du tout, ou reste figée indéfiniment sur le logo de démarrage sans pouvoir accéder au mode Recovery ou Fastboot, vous êtes face à un "hard brick".

Grâce à l'architecture du processeur Allwinner A523, la tablette est récupérable via le **Mode FEL** matériel.

## Prérequis
1. Un ordinateur sous Linux (Ubuntu/Debian recommandé).
2. Le script `emmc-tool.sh` (et les binaires `xfel` compilés pour A523) présents dans le dossier `scripts/`.
3. Les fichiers images d'origine (les dumps) présents dans le dossier `dumps/`.
4. Un câble USB data de bonne qualité.

## Étape 1 : Entrer en mode FEL
Suivez le guide complet : [Comment entrer en mode FEL](FEL_MODE.md).
Vérifiez que la tablette est détectée avec la commande `lsusb` (doit afficher `1f3a:efe8`).

## Étape 2 : Préparer l'outil de flash
Ouvrez un terminal et rendez-vous dans le dossier contenant le script :
```bash
cd pcbox-pcb-t106-rescue/scripts
```

Vérifiez que l'outil communique bien avec la tablette :
```bash
sudo xfel version
```
*Si cela retourne une erreur, vérifiez votre câble USB et reprenez l'Étape 1.*

## Étape 3 : Flasher la partition corrompue

### Scénario A : Vous avez corrompu la partition `boot` (Noyau/Recovery)
C'est le cas le plus fréquent (par exemple après avoir flashé un mauvais Magisk ou GSI). Sur Android 14 GKI, le Recovery n'a plus de partition dédiée, il est inclus dans `boot`.

Flashez le noyau fonctionnel issu de nos dumps (ou celui du Teclast P30T) :
```bash
# Pour le Slot A :
./emmc-tool.sh flash boot_a ../dumps/boot_a.img
```
*(Le flash de 64 Mo en mode FEL prend environ 1h à 1h30, l'écriture se faisant par blocs de 32 Ko. Soyez patient).*

### Scénario B : La table de partitions (GPT) est détruite
Si l'ordinateur ne reconnaît même plus les partitions de la tablette.
```bash
./emmc-tool.sh flash mmcblk0 ../dumps/gpt-raw.img
```

### Scénario C : Le système entier est détruit
Il vous faudra restaurer la partition `super` (qui contient system, vendor, et product).
1. Téléchargez `super.img.zst` depuis les "Releases" GitHub de ce dépôt.
2. Décompressez-le : `zstd -d super.img.zst -o super.img`
3. Flashez-le via FEL (Attention, cela peut prendre des heures) :
```bash
./emmc-tool.sh flash super super.img
```

## Étape 4 : Redémarrer
Une fois le flash terminé à 100%, débranchez le câble USB.
Maintenez le bouton Power enfoncé pendant au moins 10 secondes pour forcer le redémarrage.
Le premier démarrage peut être long (3-4 minutes). Laissez la tablette tranquille.
