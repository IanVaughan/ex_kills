# ExKills

mix deps.get
iex -S mix
docker build .
docker run


gcloud components update
gcloud components install kubectl
gcloud init


gcloud app browse

gcloud builds list
gcloud builds log
gcloud builds submit --substitutions=_TAG=v8 .

gcloud info

gcloud container clusters create ex-kills-cluster-us-east1 --num-nodes=1 --zone=us-east1 --scopes=gke-default,sql-admin
gcloud container clusters get-credentials --zone=europe-west2 ex-kills-cluster
gcloud config set container/cluster ex-kills-cluster

gcloud container images list
gcloud container images list --version

gcloud sql instances create ex-kills-db-us-east1 --region=us-east1 --database-version=POSTGRES_9_6 --tier=db-f1-micro
gcloud sql instances describe ex-kills-db-us-east1
gcloud sql users set-password postgres --instance=ex-kills-db --prompt-for-password

psql "host=127.0.0.1 port=5432 sslmode=disable dbname=ex-kills-db2 user=postgres"
psql "sslmode=disable host=/tmp/cloudsql/ex-kills-project-us-east1:us-central1:ex-kills-db2 user=postgres"
psql -h /tmp/cloudsql/ex-kills-project-us-east1:us-central1:ex-kills-db2 -U postgres -d ex_kills_repo

gcloud sql instances describe ex-kills-db2



First, configure your local Docker client to be able to authenticate to Container Registry (note: you’ll only need to do this step once):

export PROJECT_ID="$(gcloud config get-value project -q)"
gcloud auth configure-docker

Next, tag the local Docker image for uploading:

docker tag simple-web-app:latest "gcr.io/${PROJECT_ID}/simple-web-app:v1"

Finally, push the Docker image to your private Container Registry:

docker push "gcr.io/${PROJECT_ID}/simple-web-app:v1"



kubectl run hello-web --image=gcr.io/${PROJECT_ID}/hello:v1 --port 8080


