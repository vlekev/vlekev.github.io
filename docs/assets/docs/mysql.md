# MYSQL

[Retour au sommaire](docs/index)

## Commandes utiles
- Se connecter à la base de donnée (DATABASE):
```bash
mysql -u [[USER]] -p [[PASSWORD]] -h [[HOST]] -P [[PORT(3306)]] -D [[DATABASE]]"
```
- Faire une requête sur DATABASE:
```bash
mysql -u [[USER]] -p [[PASSWORD]] -h [[HOST]] -P [[PORT(3306)]] -D [[DATABASE]] -Bsre "[[SQL]]"
```
- Exporter une base de donnée:
```bash
mysqldump -u [[USER]] -p [[PASSWORD]] -h [[HOST]] -P [[PORT(3306)]] --single-transaction --skip-lock-tables --routines --triggers [[DATABASE]] > [[EXPORT_NAME]].sql
```
- Importer une base de donnée:
```bash
mysql -u [[USER]] -p[[PASSWORD]] -h [[HOST]] -P [[PORT(3306)]] [[DATABASE]] < [[EXPORT_NAME]].sql
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
- Obtenir les droits de USER:
```sql
SHOW GRANTS FOR [[USER]];
```
- Donner les droits sur DATABASE a USER:
```sql
GRANT ALL PRIVILEGES ON [[DATABASE(*)]].[[TABLE(*)]] TO '[[USER]]'@'[[HOSTNAME(%)]]';FLUSH PRIVILEGES;
```
- Supprimer un USER:
```sql
DROP USER '[[USER]]'@'[[HOSTNAME]]';
```
- Sortir le résultat d'une requête en csv dans le dossier '/var/lib/mysql/' par défaut:
```sql
SELECT [[SELECTION(*)]] FROM [[TABLE]] INTO OUTFILE '[[CSV_NAME]].csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';
```
- Créer une TABLE:
```sql
CREATE TABLE [[TABLE]] (
    [[COLUMN]] [[DATA_TYPE(BOOL, INT(11), DEC(10,3), VARCHAR(255),...)]] [[CONSTRAINT(NOT NULL, UNIQUE, ...)]],
    [[...]],
    CONSTRAINT PK_[[TABLE]] PRIMARY KEY ([[COLUMNS]])
);
```
- Mettre à jour une/des donnée(s) de TABLE:
```sql
UPDATE [[TABLE]] SET [[COLUMN]]=[[VALUE]],[[...]] WHERE [[CONDITIONS]];
```
- Ajouter une ligne total a TABLE:
```sql
SELECT [[SELECTION(*)]] FROM [[TABLE]] GROUP BY [[...]] WITH ROLLUP;
```
- Obtenir la taille de chaque base de donnée:
```sql
SELECT
    table_schema "database",
    ROUND(COALESCE(SUM(data_length + index_length),0) / 1024 / 1024, 1) "taille (MB)"
FROM information_schema.tables
GROUP BY table_schema;
```
- Réutiliser une requête pour une autre:
```sql
WITH [[REQUETE_NAME]] AS (
	SELECT [[SELECTION(*)]] FROM [[TABLE]]
)
SELECT [[SELECTION(*)]] FROM [[REQUETE_NAME]];
```
