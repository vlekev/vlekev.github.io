# Kubernetes

[Retour au sommaire](docs/index)

## Kubectl

### Commandes utiles
- Changer de namespace
```bash
kubectl config set-context --current --namespace=[[NAMESPACE]]
```
- Obtenir la ressource
```bash
kubectl get [[RESSOURCE]]
```
- Affiche les informations de la ressource
```bash
kubectl describe [[RESSOURCE]]
```
- Executer un terminal sur POD
```bash
kubectl exec -it [[POD]] -- /bin/bash
```
- Lier un PORT_LOCAL à un PORT_DISTANT d'un SERVICE
```bash
kubectl port-forward services/[[SERVICE]] [[PORT_LOCAL]]:[[PORT_DISTANT]]
```
- Configurer une/des ressource(s) kubernetes
```bash
kubectl apply -f [[CONFIG_FILE]].yaml
```
- Remplacer une/des ressource(s) kubernetes
```bash
kubectl replace --force -f [[CONFIG_FILE]].yaml
```
- Créer un configMap
```bash
kubectl create configmap [[SECRET_NAME]] (--from-literal [[KEY]]='[[VALUE]]')|(--from-file [[FILE]])
```
- Créer un Secret
```bash
kubectl create secret generic [[SECRET_NAME]] (--from-literal [[KEY]]='[[VALUE]]')|(--from-file=[[KEY]]=[[FILE]])
```
- Supprimer un Secret
```bash
kubectl delete secret [[SECRET_NAME]] --ignore-not-found
```
- Obtenir les performances des pods:
```bash
kubectl get pods -o=custom-columns='NAME:metadata.name,CPU:spec.containers[].resources.limits.cpu,RAM:spec.containers[].resources.limits.memory'
```
- Copier fichier/répertoire dans POD vers local:
```bash
kubectl cp [[NAMESPACE]]/[[POD]]:[[PATH_FILE_TARGET]] [[PATH_FILE_DESTINATION]]
```
- Copier fichier/répertoire vers POD:
```bash
kubectl cp [[PATH_FILE_TARGET]] [[NAMESPACE]]/[[POD]]:[[PATH_FILE_DESTINATION]]
```

### Snippet
- ConfigMap:
```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: [[CONFIGMAP_NAME]]
data:
  [[CONFIGMAP_KEY]]: [[CONFIGMAP_VALUE]]
```
- Secret:
```yml
apiVersion: v1
kind: Secret
metadata:
  name: [[SECRET_NAME]]
type: Opaque
stringData:
  [[SECRET_KEY]]: [[SECRET_VALUE]]
```
- Service:
```yml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: [[APP_NAME]]
  name: [[SERVICE_NAME]]
  namespace: [[NAMESPACE]]
spec:
  ports:
    - name: http
      port: 80
      targetPort: [[PORT]]
  selector:
    app: [[APP_NAME]]
```
- Pod:
```yml
apiVersion: v1
kind: Pod
metadata:
  name: [[POD_NAME]]
spec:
  containers:
  - name: [[APP_NAME]]
    image: [[IMAGE]]:[[IMAGE_TAG]]
    resources:
      limits:
        cpu: '[[CPU_LIMIT]]'
        memory: [[MEMORY_LIMIT]]
      requests:
        cpu: '[[CPU_REQUEST]]'
        memory: [[MEMORY_REQUEST]]
```
- PersistentVolumeClaim:
```yml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  labels:
    service: [[SERVICE_NAME]]
  name: [[PVC_NAME]]
  namespace: [[NAMESPACE]]
spec:
  accessModes:
    - [['ReadWriteOnce'|'ReadOnlyMany'|'ReadWriteMany']]
  resources:
    requests:
      storage: [[SIZE_STORAGE]]
  storageClassName: [[STORAGE_CLASSNAME]]
```
- Deployement:
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: [[APP_NAME]]
  name: [[DEPLOYEMENT_NAME]]
  namespace: [[NAMESPACE]]
spec:
  replicas: [[NB_REPLICA]]
  selector:
    matchLabels:
      app: [[APP_NAME]]
  template:
    metadata:
      labels:
        app: [[APP_NAME]]
        version: [[APP_VERSION]]
    spec:
      containers:
        - env:
          - name: [[ENV_KEY]]
            value: [[ENV_VALUE]]
          - name: [[ENV_KEY]]
            valueFrom:
              secretKeyRef:
                key: [[ENV_SECRET_KEY]]
                name: [[ENV_SECRET]]
          image: '[[IMAGE]]:[[IMAGE_TAG]]'
          imagePullPolicy: Always
          name: [[APP_NAME]]
          ports:
            - containerPort: [[PORT]]
          resources:
            limits:
              cpu: '[[CPU_LIMIT]]'
              memory: [[MEMORY_LIMIT]]
            requests:
              cpu: '[[CPU_REQUEST]]'
              memory: [[MEMORY_REQUEST]]
          volumeMounts:
            - mountPath: [[STORAGE_PATH]]
              name: [[STORAGE_NAME]]
          securityContext:
            runAsNonRoot: true
            runAsUser: [[USER_ID]]
      imagePullSecrets:
        - name: [[REGISTRY_SECRET_ID]]
      volumes:
        - name: [[STORAGE_NAME]]
          persistentVolumeClaim:
            claimName: [[STORAGE_CLAIM_NAME]]
```
