# Ssh

[Retour au sommaire](docs/index)

## Commandes utiles
- Reconnaitre HOST pour ssh:
```bash
ssh-keyscan -H [[HOST]] >> ~/.ssh/known_hosts
```
- Créer une paire de clef:
```bash
ssh-keygen -N [[PASSPHRASE]] -f [[SSH_KEY_NAME]]
```
- Ajouter la clef SSH_KEY_NAME à l'agent ssh:
```bash
! $(ps -p $SSH_AGENT_PID &> /dev/null) && eval "$(ssh-agent -s)"
ssh-add ~/.ssh/[[SSH_KEY_NAME]]
```
- Ajouter la clef au serveur (si mot de passe activé sinon placer soit même):
```bash
ssh-copy-id [[SSH_USER]]@[[SSH_HOST]] -p[[SSH_PORT]] -i ~/.ssh/[[SSH_KEY_NAME]]
```
- Se connecter:
```bash
ssh [[SSH_USER]]@[[SSH_HOST]] -p[[SSH_PORT]] -i ~/.ssh/[[SSH_KEY_NAME]]
```
- Port forward:
```bash
ssh -L [[LOCAL_PORT]]:[[HOST_CIBLE]]:[[HOST_CIBLE_PORT]] [[SSH_USER]]@[[SSH_HOST]]
```
