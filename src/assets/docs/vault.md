# Vault

[Retour au sommaire](docs/index)

## Vault CLI
- Configurer:
```bash
export VAULT_ADDR=[[VAULT_URL]]
export VAULT_NAMESPACE=[[VAULT_NAMESPACE]]
export VAULT_FORMAT=[[VAULT_FORMAT_OUTPUT('table','json','yaml')]]
```

- Se connecter:
```bash
vault login -method=[[LOGIN_METHOD]]
```

- Lister les mode d'authentification:
```bash
vault auth list
```

- Activer un mode d'authentification MODE_AUTH:
```bash
vault auth enable [[MODE_AUTH]]
```

- Lister les règles de séCurité:
```bash
vault policy list
```

- Ajouter une règle de sécurité POLICY_NAME :
```bash
vault policy write [[POLICY_NAME]] [[JSON_POLICY_FILE]]
```

- Lister les roles:
```bash
vault list auth/[[MODE_AUTH]]/role
```

- Créer un role ROLE_NAME:
```bash
vault write auth/[[MODE_AUTH]]/role/[[ROLE_NAME]] [[JSON_ROLE_FILE]]
```

- Créer un secret SECRET:
```bash
vault kv put secret/[[PATH_SECRET]] @[[JSON_ROLE_FILE]]
```

- Obtenir un secret SECRET:
```bash
vault kv get secret/[[PATH_SECRET]]
```
