# Docker

[Retour au sommaire](docs/index)

## Docker CLI
- Créer une image docker local avec DOCKERFILE et pour nom IMAGE:
```bash
docker build [[DOCKERFILE]] -t [[IMAGE]]:[[VERSION]]
```
- Se connecter à REGISTRY:
```bash
docker login [[REGISTRY]]
```
- Obtenir une IMAGE:
```bash
docker pull [[IMAGE]]
```
- Exporter IMAGES vers TAR_FILE:
```bash
docker save [[IMAGES]] -o [[TAR_FILE]]
```
- Importer les images de TAR_FILE:
```bash
docker load -i [[TAR_FILE]]
```
- Donner un tag à une IMAGE:
```bash
docker tag [[IMAGE]]:[[VERSION]] [[NEW_IMAGE]]:[[NEW_VERSION]]
```
- Envoyer une IMAGE (penser à renommer l'image pour être en accord avec le registry):
```bash
docker push [[IMAGE]]:[[VERSION]]
```
- Lancer une IMAGE avec pour utilisateur CONTAINER_USER:
```bash
docker run -dp [[HOST_PORT]]:[[CONTAINER_PORT]] -v [[HOST_DIR/VOLUME_NAME]]:[[CONTAINER_DIR]] --network [[CONTAINER_NETWORK]] -u [[CONTAINER_USER]]:[[CONTAINER_GROUP]] --name [[CONTAINER_NAME]] --restart unless-stopped [[IMAGE]]:[[VERSION]]
```
- Supprimer le CONTAINER_NAME:
```bash
docker rm [[CONTAINER_NAME]]
```
- Obtenir les logs du CONTAINER_NAME:
```bash
docker logs [[CONTAINER_NAME]] -f
```
- Copier des FILES sur CONTAINER_NAME:
```bash
docker cp [[FILES_SOURCE]] [[CONTAINER_NAME]]:[[FILES_DESTINATION]]
```
- Accéder au CONTAINER_NAME:
```bash
docker exec -it [[CONTAINER_NAME]] bash
```
- Supprimer tout ce qui n'est pas utilisé:
```bash
docker system prune
```

## Docker compose
- Build les services:
```bash
docker-compose build
```
- Builder, Créer et démarrer les services:
```bash
docker-compose up -d --build
```
- Arréter et supprimer les services:
```bash
docker-compose down
```
### Example
```compose
version: '3.8' # version de compose utilisé

services:
  debian: &os # un service ce qui pourra être réutilisé sur d'autre service
    container_name: debian # nom du service dans docker
    image: service:latest # image et tag utilisé
    volumes:
    - ./script.sh:/opt/script.sh # on ajoute les volumes
    ports:
    - "8080:8080" # port forwardé
    entrypoint: [ "/bin/bash" ] # 
  debian-2:
    <<: *os # ici on réaplique le service précédent
    container_name: debian-2 # on override si besoin
    ports:
    - "8081:8080"
    depends_on:
      - debian # debian-2 attendra que debian démarre
```