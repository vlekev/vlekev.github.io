# Raspberry pi

[Retour au sommaire](docs/index)

## Installation de la carte SD
- Insérer la carte SD dans un PC et vérifier qu'elle a une partition complète
    - Depuis Windows utiliser le raccourcie Windows+R, taper `diskmgmt.msc`
    - Depuis Linux taper `sudo fdisk -l`
- Télécharger Rpi Imager [Windows](https://downloads.raspberrypi.org/imager/imager_latest.exe) ou [Linux](https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb)
- Lancer l'executable, choisir le modèle de raspberry, choisir l'OS puis sélectionner suivant, modifier les réglages (renommer le hostname, modifier l'utilisateur, modifier les réglage locaux et activer le ssh. Si il n'y as pas d'ethernet disponible activer le wifi)

## Finaliser les raspberry
- Insérer la carte SD dans la raspberry, connecter l'ethernet si il en as de disponible et mettre l'alimentation
- Rechercher l'IP de la raspberry en allant sur l'interface d'administration de la box (Depuis Windows utiliser le raccourcie Windows+R, taper `cmd`, lancer la commande `ipconfig` et c'est la "passerelle par défaut". Depuis Linux lancer la commande `ip route` et c'est le "default via". Généralement c'est `http://192.168.1.1`)
- Depuis le PC utiliser ssh sur l'IP ou l'hostname de la raspberry `ssh [[USER]]@[[IP/HOSTNAME]]`. Accepter le fingerprint, renseigner son mot de passe et c'est bon la raspberry est utilisable
