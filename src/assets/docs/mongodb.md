# Mongodb

[Retour au sommaire](docs/index)

## Commandes utiles

- Se connecter à la base de donnée (DATABASE):

```bash
mongosh "mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(27017)]]/[[DATABASE('')]]"
```

- Faire une requête sur DATABASE:

```bash
mongosh "mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(27017)]]/[[DATABASE('')]]" --eval "[[QUERY_JAVASCRIPT]]"
```

- Exporter une base de donnée:

```bash
mongodump --uri="mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(27017)]]/[[DATABASE('')]]" -o [[EXPORT_NAME]] --gzip
```

- Importer une base de donnée:

```bash
mongorestore --uri="mongodb://[[USER]]:[[PASSWORD('')]]@[[HOST]]:[[PORT(27017)]]/[[DATABASE('')]]" [[EXPORT_NAME]] --gzip
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
use [[DATABASE]];
db.createUser({
  user: "[[USER]]",
  pwd: "[[PASSWORD]]",
  roles: ["readWrite"],
});
```

- Supprimer un USER:

```javascript
use [[DATABASE]]
db.dropUser("[[USER]]")
```

- Supprimer DATABASE:
```javascript
use [[DATABASE]]
db.dropDatabase()
```

- Chercher des donnée(s) de TABLE:
```javascript
db.[[TABLE]].find([[JSON_DATA_SEARCH]])
```

- Créer une/des donnée(s) de TABLE:
```javascript
db.[[TABLE]].insertMany([[ARRAY_JSON_DATA]])
```

- Mettre à jour une/des donnée(s) de TABLE:
```javascript
db.[[TABLE]].updateMany([[JSON_QUERY({_id:'x'})]], [[JSON_DATA({$set:{nom:'nouveau'}})]], [[JSON_OPTIONS]])
```

- Supprimer une/des donnée(s) de TABLE:
```javascript
db.[[TABLE]].deleteMany([[JSON_QUERY({_id:'x'})]], [[JSON_OPTIONS]])
```
