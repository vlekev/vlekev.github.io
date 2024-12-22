# Sed

[Retour au sommaire](docs/index)

## Commandes utiles
- Modifier REGEX_MATCH par REPLACE dans FICHIER:
```bash
sed -i 's/[[REGEX_MATCH]]/[[REPLACE]]/g' [[FICHIER]]
```
- Commenter des lignes de LS à LE dans FICHIER:
```bash
sed -i '[[LS]],[[LE]] s/^/#/' [[FICHIER]]
```
- Décommenter des lignes de LS à LE dans FICHIER:
```bash
sed -i '[[LS]],[[LE]] s/^#//' [[FICHIER]]
```
- Inserer INSERT aprés la ligne qui match avec MATCH dans FICHIER:
```bash
sed -i '/[[MATCH]]/a [[INSERT]]' [[FICHIER]]
```
- Ajouter TEXT au début de NUMBER_LIGNE dans FICHIER:
```bash
sed -i '[[NUMBER_LIGNE]] s|^|[[TEXT]]|' [[FICHIER]]
```
- Ajouter TEXT à la fin de NUMBER_LIGNE dans FICHIER:
```bash
sed -i '[[NUMBER_LIGNE]] s|$|[[TEXT]]|' [[FICHIER]]
```
