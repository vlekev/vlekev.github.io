# Javascript

[Retour au sommaire](docs/index)

## Nvm
Permet la gestion de multiple version de node
- Installer la dernière version LTS:
```bash
nvm install --lts
```
- Mettre VERSION comme node par defaut:
```bash
nvm alias default [[VERSION]]
```
- Réinstaller les packages de la VERSION de node vers l'actuel version:
```bash
nvm reinstall-packages [[VERSION]]
```
- Installer la dernière version de npm pour l'actuel version de node:
```bash
nvm install-latest-npm
```
- Supprimer la VERSION de node:
```bash
nvm uninstall [[VERSION]]
```
