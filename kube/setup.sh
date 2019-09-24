# please edit here
PROJECT_NAME="gke-sample-201809"
CLOUD_SQL_NAME="gke-sample-201902-sql"
CLOUD_SQL_PASSWORD="password"
SECRET_KEY_BASE="71f6ba92814970d7cea3da43610f47d7"
SECRETS_JSON_PATH=~/hoge.json

echo "Setup kubectl"
# gcloud container clusters get-credentials $CLUSTER_NAME --zone us-central1-a --project $PROJECT_NAME

echo "Setup cloudsql"
kubectl create secret generic rails --from-literal=secret-key-base=$SECRET_KEY_BASE
gcloud sql users create proxyuser cloudsqlproxy~% --instance=$CLOUD_SQL_NAME --password=$CLOUD_SQL_PASSWORD

echo "Please set this value on deploy.yml#L41"
gcloud sql instances describe $CLOUD_SQL_NAME | grep connectionName

echo "Setup secrets"
# Please download service.json from "IAM > Service Account > Create Service Account"
kubectl create secret generic cloudsql-instance-credentials --from-file=credentials.json=$SECRETS_JSON_PATH
# プロキシユーザのパスワードのsecretを作る
kubectl create secret generic cloudsql-db-credentials --from-literal=username=proxyuser --from-literal=password=$CLOUD_SQL_PASSWORD

echo "[TODO] setup database by using job"
echo "[TODO] set external ip for API"

echo "Done!"
