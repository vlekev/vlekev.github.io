# Microk8s

[Retour au sommaire](docs/index)

### Commandes utiles
- Ajouter un node:
```bash
# sur le master
microk8s.add-node | grep -m1 "microk8s join"
# copier le resulta de la commande sur le node
```
- Purge les tokens du master valide
```bash
rm /var/snap/microk8s/current/credentials/cluster-tokens.txt
```
