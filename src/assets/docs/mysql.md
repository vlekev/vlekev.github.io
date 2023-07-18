# MYSQL

[Retour au sommaire](docs/index)

## Commandes utiles
- Se connecter à la base de donnée (DATABASE):
```bash
mysql -u [[USER]] -p [[PASSWORD('')]] -h [[HOST]] -P [[PORT(3306)]] -D [[DATABASE('')]]"
```
- Faire une requête sur DATABASE:
```bash
mysql -u [[USER]] -p [[PASSWORD('')]] -h [[HOST]] -P [[PORT(3306)]] -D [[DATABASE('')]] -Bsre "[[SQL]]"
```
- Exporter une base de donnée:
```bash
mysqldump -u [[USER]] -p [[PASSWORD('')]] -h [[HOST]] -P [[PORT(3306)]] --single-transaction --skip-lock-tables --routines --triggers [[DATABASE('')]] > [[EXPORT_NAME]].sql
```
- Importer une base de donnée:
```bash
mysql [[DATABASE('')]] < [[EXPORT_NAME]].sql
```

## Requêtes utiles
- Obtenir les connections actives:
```sql
SHOW PROCESSLIST;
```
- Obtenir les bases de données:
```sql
SHOW DATABASES;
```
- Obtenir les tables de la base de donnée:
```sql
SHOW TABLES;
```
- Obtenir les colonnes de TABLE:
```sql
SHOW COLUMNS FROM [[TABLE]];
```
- Obtenir l'utilisateur actuel:
```sql
SELECT user();
```
- Obtenir les utilisateur de la base de donnée:
```sql
SELECT user,host FROM mysql.user;
```
- Créer DATABASE:
```sql
CREATE DATABASE IF NOT EXISTS [[DATABASE]];
```
- Créer USER:
```sql
CREATE USER IF NOT EXISTS '[[USER]]'@'[[HOSTNAME]]' IDENTIFIED BY '[[PASSWORD]]';
```
- Donner les droits sur DATABASE a USER:
```sql
GRANT ALL PRIVILEGES ON [[DATABASE(*)]].[[TABLE(*)]] TO '[[USER]]'@'[[HOSTNAME]]';FLUSH PRIVILEGES;
```
- Supprimer un USER:
```sql
DROP USER '[[USER]]'@'[[HOSTNAME]]';
```
- Sortir le résultat d'une requête en csv dans le dossier '/var/lib/mysql/' par défaut:
```sql
SELECT * FROM [[TABLE]] INTO OUTFILE '[[CSV_NAME]].csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
```
- Mettre à jour une/des donnée(s) de TABLE:
```sql
UPDATE [[TABLE]] SET [[COLUMN]]=[[VALUE]],[[...]] WHERE [[...]];
```
