# Windows

[Retour au sommaire](docs/index)

## Commandes WSL
- Lister les VM:
```powershell
wsl -l -v
```
- Lister les adresses ip de la VM:
```powershell
wsl hostname -I
```
- Choisir la DISTRIBUTION par defaut:
```powershell
wsl -s [[DISTRIBUTION]]
```
- Exporter une DISTRIBUTION:
```powershell
wsl --export [[DISTRIBUTION]] "[[FICHIER_EXPORT]]"
```
- Importer une DISTRIBUTION:
```powershell
wsl --import [[DISTRIBUTION]] "[[DOSSIER_DESTINATION]]" "[[FICHIER_EXPORT]]"
```
- Supprimer une DISTRIBUTION:
```powershell
wsl --unregister [[DISTRIBUTION]]
```
- Mettre à jour wsl:
```powershell
wsl --update
```
- Monter le disque D: dans wsl (il faut peut être mettre à jour wsl):
```bash
sudo mount -t drvfs d: /mnt/d
```

## Démarrage service WSL au démarrage

- Ajouter ```%sudo ALL=(ALL) NOPASSWD: [[COMMANDE]]``` dans /etc/sudoers de wsl si il necessaire d'être root
- Raccourcie Win+R et renseigner "taskschd.msc"
- Click droit "Bibliothèque du planificateur de tâches" > créer une tâche de base
- Renseigner "nom" > choisir "quand j'ouvre la session" > Choisir "démarrer un programme" > renseigner "C:\Windows\System32\bash.exe" dans "script" et la commandes "-c "[[COMMANDE]]" dans "argument"

## Donner l'accés aux données en modification windows à WSL

- Depuis l'explorateur click droit sur le fichier/dossier > "Propriétés"
- Sur l'onglet "Sécurité" > "Modifier..." > "Ajouter"
- Renseigné son utilisateur dans "Entrez les noms des objets ..." > "Ok"
- Cocher "Lecture" et/ou "Ecriture" > "Ok"

## Démarrage d'une application au démarrage

- Raccourcie Win+R
- shell:startup
- Ajouter les raccourcies de l'application voulue
