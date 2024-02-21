# Linux

[Retour au sommaire](docs/index)

## Sed
- Modifier REGEX_MATCH par REPLACE dans FICHIER:
```bash
sed -i 's/[[REGEX_MATCH]]/[[REGEX_MATCH]]/g' [[FICHIER]]
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

- Activer les logs de cron:
```bash
sed -i 's/^#cron.\*/cron.\*/' /etc/rsyslog.conf
```

- Ajouter TEXT au début de NUMBER_LIGNE dans FICHIER:
```bash
sed -i '[[NUMBER_LIGNE]] s|^|[[TEXT]]|' [[FICHIER]]
```

- Ajouter TEXT à la fin de NUMBER_LIGNE dans FICHIER:
```bash
sed -i '[[NUMBER_LIGNE]] s|$|[[TEXT]]|' [[FICHIER]]
```

## Ssh
- Reconnaitre HOST pour ssh:
```bash
ssh-keyscan -H [[HOST]] >> ~/.ssh/known_hosts
```
- Créer une paire de clef:
```bash
ssh-keygen -t ed25519 -b 4096 -N [[PASSPHRASE]] -f [[SSH_KEY_NAME]]
```
- Ajouter la clef au serveur (si mot de passe activé sinon placer soit même):
```bash
cat ~/.ssh/[[SSH_KEY_NAME]].pub | ssh [[SSH_USER]]@[[SSH_HOST]] 'cat >> ~/.ssh/authorized_keys'
```
- Se connecter:
```bash
ssh [[SSH_USER]]@[[SSH_HOST]] -p[[SSH_PORT]] -i ~/.ssh/[[SSH_KEY_NAME]]
```
- Port forward:
```bash
ssh -L [[LOCAL_PORT]]:[[HOST_CIBLE]]:[[HOST_CIBLE_PORT]] [[SSH_USER]]@[[SSH_HOST]]
```

## Commandes utiles
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

- Obtenir les utilisateurs connectés:
```bash
w
```

- Ecrire sur un autre terminal local:
```bash
echo TEXT > /dev/pts/[[TERMINAL_ID]]
```

- Lister l'espace disponible:
```bash
df -f
```

- Lister la taille de chaque dossier du répertoire courant:
```bash
du -hd1
```

- Lister tout les fichiers de moins de NB_JOUR jour(s) du répertoire DIR sans le repertoire EXCLUDE_DIR:
```bash
find [[DIR]] -type f -mtime -[[NB_JOUR]] !-path [[EXCLUDE_DIR]] -exec -hs1 {} \;
```

- Lister tout les ports utilisés:
```bash
ss -lntu
```

- Lister tout les fichiers dans DOSSIER qui contient TEXT:
```bash
grep -rnw [[DOSSIER]] -e '[[TEXT]]'
```

- Zipper un DOSSIER dans un FICHIER:
```bash
zip -rq [[FICHIER]] [[DOSSIER]]
```

- Hasher TEXT en md5:
```bash
echo "[[TEXT]]" | md5sum | cut -d' ' -f1
```

- Trouver un TEXT dans les fichiers du DOSSIER:
```bash
grep -hornw '[[DOSSIER]]' -e '[[TEXT]]'
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

- Ajouter un droit (rwX) spécifique par défaut à USER sur le DOSSIER:
```bash
sudo setfacl -dR -m u:"[[USER]]":rwX [[DOSSIER]]
```

- Ajouter un droit (rwX) spécifique à USER sur le DOSSIER sur tout ce qu'il contient:
```bash
sudo setfacl -R -m u:"[[USER]]":rwX [[DOSSIER]]
```

- Tester une KEY de ARRAY existe:
```bash
[ "${[[ARRAY]][[[KEY]]]+1}" ] && echo "existe || echo "n'existe pas"
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

- Appel API:
```bash
curl -H "[[HEADER_KEY]]: [[HEADER_VALUE]]" -X [[METHOD_HTTP]] [[URL]] -d "[[BODY_DATA]]"
```

- Obtenir l'ip d'un domaine:
```bash
dig +short [[DOMAINE]]
```

- Obtenir le dns inverse d'une ip :
```bash
dig +short -x [[IP]]
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
