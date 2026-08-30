# PCBOX PCB-T106 S10 (Allwinner A523) - Rescue & Debrick

Bienvenue sur le dépôt communautaire dédié à la sauvegarde, la restauration et le débriçage de la tablette **PCBOX PCB-T106 S10** (aussi connue sous le nom générique Digiland MID1058), propulsée par le SoC **Allwinner A523**.

Ce dépôt a été créé suite à un "hard brick" (corruption de la partition `boot` contenant le recovery sur une architecture A/B) et à sa restauration réussie via le mode matériel FEL.

## Pourquoi ce dépôt ?
Les tablettes dites "blanches" (génériques) fournissent rarement des firmwares officiels au public. Si vous modifiez votre tablette (root, GSI, custom ROM) et que vous la bloquez sur un écran noir ou un logo de démarrage, vous n'avez généralement aucun moyen de la récupérer.

Ce projet rassemble :
- Les **dumps originaux** des partitions d'usine (boot, vbmeta, dtbo, GPT)
- La **partition super (système complet)** compressée [disponible dans les Releases]
- Les **guides pas-à-pas** pour communiquer avec le processeur directement via USB (mode FEL)
- Les **scripts automatiques** de sauvegarde (via ADB root ou FEL)

## Documentation disponible

1. 📖 **[Guide de Débriçage (Hard Brick)](DEBRICK_GUIDE.md)** : Comment ramener votre tablette à la vie si elle ne s'allume plus du tout.
2. 🔌 **[Comment entrer en mode FEL](FEL_MODE.md)** : La combinaison secrète de boutons pour forcer la puce Allwinner à communiquer avec le PC.
3. 🧬 **[Hardware & Spécifications](HARDWARE.md)** : Tous les détails techniques, logs noyau (`dmesg`), et identifiants matériels (getprop) de la tablette.
4. 💾 **[Tableau des Partitions](PARTITIONS.md)** : La liste complète des 28 partitions de la mémoire eMMC (Tailles, LBA, Utilité).
5. 🔄 **[Firmwares Compatibles](COMPATIBILITY.md)** : Les firmwares clones testés et fonctionnels (comme le Teclast P30T).

## Contenu du dépôt (Fichiers techniques)

- `dumps/` : Contient les images brutes des petites partitions (boot, dtbo, vbmeta...).
- `scripts/` : Scripts shell pour automatiser les sauvegardes (`dump_all_adb.sh` pour ADB Root, `dump_all_fel.sh` pour le mode FEL).
- `reference/` : Exports texte des configurations système (`cpuinfo`, `lsmod`, `getprop`, etc.).

---
*Maintenu par NemStudio18 et la communauté open-source.*
