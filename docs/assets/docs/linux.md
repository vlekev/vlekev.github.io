# Linux

[Retour au sommaire](docs/index)

## Administration serveur
- Créer un nouvel USER
```bash
useradd [[USER]] -G [[GROUPS]] -s [[SHELL(/usr/sbin/nologin)]]
```
- Supprimer un USER
```bash
userdel --remove [[USER]]
```
- Changer son mot de passe
```bash
passwd [[USER]]
```
- Obtenir les utilisateurs connectés:
```bash
w
```
- Obtenir la liste des dernières connections de USER:
```bash
last [[USER]] -s -[[DAYS_NUMBER]]days
```
- Créer un lien symbolique de TARGET vers DIRECTORY
```bash
ln -s [[TARGET]] [[DIRECTORY]]
```
- Obtenir son ip externe
```bash
curl ifconfig.me
```
- Lister les processus qui utilise FILE:
```bash
lsof [[FILE]]
```
- Ajouter un droit (rwX) spécifique par défaut à USER sur le DOSSIER:
```bash
sudo setfacl -dR -m u:"[[USER]]":rwX [[DOSSIER]]
```
- Ajouter un droit (rwX) spécifique à USER sur le DOSSIER sur tout ce qu'il contient:
```bash
sudo setfacl -R -m u:"[[USER]]":rwX [[DOSSIER]]
```
- Lister l'espace disponible:
```bash
df -h
```
- Lister la taille de chaque dossier du répertoire courant:
```bash
du -hd1
```
- Lister tout les fichiers de moins de NB_JOUR jour(s) du répertoire DIR sans le repertoire EXCLUDE_DIR:
```bash
find [[DIR]] -type f -mtime -[[NB_JOUR]] !-path [[EXCLUDE_DIR]] -exec -hs1 {} \;
```
- Lister les processus:
```bash
ps auxw
# ou
top
```
- Vérifier les performances ram:
```bash
free -h
```

## Cron
- Lister les cron de USER:
```bash
crontab -l -u [[USER]]
```
- Editer les cron de USER:
```bash
crontab -e -u [[USER]]
```
- Activer les logs de cron:
```bash
sed -i 's/^#cron.\*/cron.\*/' /etc/rsyslog.conf
```

## Gestion d'archive
- Création d'une archive tgz
```bash
tar -czvf [[ARCHIVE_NAME]] [[FILES_OR_DIRECTORY]]...
```
- Lecture d'une archive tgz
```bash
tar -tzvf [[ARCHIVE_NAME]]
```
- Extraction d'une archive tgz
```bash
tar -xzvf [[ARCHIVE_NAME]]
```
- Création d'une archive zip
```bash
zip -rq [[ARCHIVE_NAME]] [[FILES_OR_DIRECTORY]]...
```
- Extraction d'une archive zip
```bash
unzip [[ARCHIVE_NAME]] -d [[DESTINATION]]
```

## Reseau
- Obtenir l'ip d'un domaine:
```bash
dig +short [[DOMAINE]]
```
- Obtenir le dns inverse d'une ip :
```bash
dig +short -x [[IP]]
```
- Appel API:
```bash
curl -s -H "[[HEADER_KEY]]: [[HEADER_VALUE]]" -X [[METHOD_HTTP]] [[URL]] -d "[[BODY_DATA]]"
```
- Transfert FICHIER d'un serveur en local:
```bash
rsync -azsP -e "ssh -p [[PORT]]" "[[USER]]@[[IP]]:[[DOSSIER_SOURCE]]/[[FICHIER]]" "[[DOSSIER_DESTINATION]]/[[FICHIER]]"
```
- Transfert DOSSIER d'un serveur en local:
```bash
rsync -azsP -e "ssh -p [[PORT]]" "[[USER]]@[[IP]]:[[DOSSIER_SOURCE]]/" "[[DOSSIER_DESTINATION]]" --exclude '[[FILES_EXCLUDE]]'
```
- Transfert DOSSIER d'un serveur en local:
```bash
scp -rP[[PORT]] -i [[PRIVATE_KEY_SSH]] [[USER]]@[[IP]]:[[DOSSIER_SOURCE]]/* [[DOSSIER_DESTINATION]]
```
- Tester un port distant:
```bash
nc -vvv -w 10 [[IP]] [[PORT]]
```
- Lister tout les ports utilisés:
```bash
ss -anptu
```
- Lister tout les ports utilisés sur une machine distante:
```bash
nmap [[IP]]
```

## Commandes utiles
- Afficher le résultat de la COMMANDE sur stderr:
```bash
[[COMMANDE]] >&2
```
- Mettre le résultat stdout de la COMMANDE dans FILE1 et stderr dans FILE2:
```bash
[[COMMANDE]] > [[FILE1]] 2> [[FILE2]]
```
- Mettre tout le résultat de la COMMANDE dans FILE:
```bash
[[COMMANDE]] &> [[FILE]]
```
- Ecrire sur un autre terminal local:
```bash
echo TEXT > /dev/pts/[[TERMINAL_ID]]
```
- Lister tout les fichiers dans DOSSIER qui contient TEXT:
```bash
grep -rnw [[DOSSIER]] -e '[[TEXT]]'
```
- Hasher TEXT en md5:
```bash
echo "[[TEXT]]" | md5sum | cut -d' ' -f1
```
- Trouver un TEXT dans les fichiers du DOSSIER:
```bash
grep -hornw '[[DOSSIER]]' -e '[[TEXT]]'
```
- Tester une KEY de ARRAY existe:
```bash
[ "${[[ARRAY]][[[KEY]]]+1}" ] && echo "existe" || echo "n'existe pas"
```
- Prendre une partie de STRING:
```bash
${[[STRING]]:2}
```
- Afficher la liste des url activées sur la vm:
```bash
grep -Rwho '/etc/apache2/sites-enabled/' -e 'ServerName .*' --exclude=*-le-ssl.conf | cut -d' ' -f2
```
- Afficher les variables d'environnements:
```bash
printenv
```
- Yaml vers Json:
```bash
yq -o=json eval [[FILE]].yml
```
- Création d'un certificat autosigné:
```bash
domaine=*.domaine.tdl
openssl genrsa -aes128 2048 > $domaine.key
openssl rsa -in $domaine.key -out $domaine.key
openssl req -utf8 -new -key $domaine.key -out $domaine.csr
openssl x509 -in $domaine.csr -out $domaine.crt -req -signkey $domaine.key -days 3650
```
- Bashrc custom
```bash
# Synchronisation la commande history avec plusieur session
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```
