# MS-SQL

[Retour au sommaire](index.md)

## Commandes utiles
- Se connecter à la base de donnée (DATABASE):
```bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U [[USER]] -d [[DATABASE]]
```
- Obtenir les bases de données:
```sql
select name from sys.databases
```
- Obtenir les tables de la base de donnée:
```sql
select table_name from information_schema.tables
```
- Obtenir les colonnes de la base de donnée:
```sql
select table_name, column_name from information_schema.columns
```
- Lancer les requêtes:
```sql
go
```
