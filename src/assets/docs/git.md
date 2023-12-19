# Git

[Retour au sommaire](index.md)

## Commandes utiles
- Obtenir le repo du projet:
```bash
git config --get remote.origin.url
```
- Obtenir le numéro de commit actuel:
```bash
git rev-parse HEAD
```
- Obtenir la version actuel:
```bash
git describe --tags
```
- Annuler les derniers commit:
```bash
git reset HEAD~
```
- Changer de COMMIT/TAG/BRANCH:
```bash
git checkout [[COMMIT/TAG/BRANCH]]
```
- Changer de COMMIT et créer une nouvelle BRANCH sur celle ci:
```bash
git checkout -b [[BRANCH]] [[COMMIT]]
```
- Remettre le FICHIER comme il était:
```bash
git checkout [[FICHIER]]
```
- Supprimer un TAG:
```bash
git tag --delete [[TAG]]
```
- Afficher le graph du repo git:
```bash
git log --all --decorate --oneline --graph
```
- Changer le USERNAME utilisé par git:
```bash
git config --global user.name "[[USERNAME]]"
```
- Changer l'EMAIL utilisé par git:
```bash
git config --global user.email [[EMAIL]]
```
- Lister les remote:
```bash
git remote -v
```
- Ajouter REMOTE:
```bash
git remote add [[REMOTE]] [[REMOTE_URL]]
```
- Supprimer REMOTE:
```bash
git remote rm upstream [[REMOTE]]
```
- Supprimer BRANCH:
```bash
git branch -d [[BRANCH]]
```
- Sauvegarder les modifications actuel dans package de modification:
```bash
git stash
```
- Lister les packages de modification sauvegarder:
```bash
git stash list
```
- Supprimer un package de modification:
```bash
git stash drop [[STASH_ID]]
```
- Remise à zéro des packages de modification:
```bash
git stash clear
```
- Utiliser une autre clef ssh:
```bash
git config core.sshCommand 'ssh -i [[PRIVATE_KEY_FILE]]'
```
