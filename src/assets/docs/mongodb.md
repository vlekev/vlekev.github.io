# MYSQL

[Retour au sommaire](index.md)

## Commandes utiles

- Se connecter à la base de donnée (DATABASE):

```bash
mongosh "mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(3306)]]/[[DATABASE('')]]"
```

- Faire une requête sur DATABASE:

```bash
mongosh "mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(3306)]]/[[DATABASE('')]]" --eval "[[QUERY_JAVASCRIPT]]"
```

- Exporter une base de donnée:

```bash
mongodump --uri="mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(3306)]]/[[DATABASE('')]]" -o [[EXPORT_NAME]].json
```

- Importer une base de donnée:

```bash
mongorestore --uri="mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(3306)]]/[[DATABASE('')]]" [[EXPORT_NAME]].json
```

## Requêtes utiles

- Obtenir les connections actives:

```javascript
db.currentOp();
```

- Obtenir les bases de données:

```javascript
show databases
```

- Obtenir les tables de la base de donnée:

```javascript
show tables
```

- Obtenir les colonnes de TABLE:

```javascript
SHOW COLUMNS FROM [[TABLE]];
```

- Obtenir l'utilisateur actuel:

```javascript
db.runCommand({ connectionStatus: 1 });
```

- Obtenir les utilisateur de la base de donnée:

```javascript
show users
```

- Créer USER:

```javascript
use[[DATABASE]];
db.createUser({
  user: "[[USER]]",
  pwd: "[[PASSWORD]]",
  roles: ["readWrite"],
});
```

- Supprimer un USER:

```javascript
use[[DATABASE]];
db.dropUser("[[USER]]");
```
