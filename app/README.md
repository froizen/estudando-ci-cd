# onboarding-sre

### Requisitos 

```
Instale na sua maquina python3 e o pip3

```

```
git clone <projeto>
cd app
python3 -m venv .
source ./bin/activate
```

### Instalando todas as dependencias 

```
pip3 install --no-cache-dir -r requirements.txt
python app.py

```

### Acesse no browser na porta 5000 ou via curl

```
curl localhost:5000
curl localhost:5000/redis
curl localhost:5000/postgres
curl localhost:5000/error
curl localhost:9999/metrics

```

docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=senhafacil -d postgres

docker run --name some-redis -p 6379:6379 -d redis


---------------------
instalação dos helm charts:

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update


helm install prometheus prometheus-community/kube-prometheus-stack -n prometheus --create-namespace
helm install my-redis bitnami/redis -f values-redis.yaml --version 17.11.5
helm install my-postgresql bitnami/postgresql -f values-postgresql.yaml --version 12.5.7

fazer build da imagem diretamente no cluster (minikube):
eval $(minikube docker-env)  
docker build -t flask-app:latest . 

kubectl apply -f manifesto/