# airflow-spark-k8s-poc

1. Install airflow ns
kubectl create namespace airflow-cluster

2. Check pods working 
kubectl get pods -n airflow-cluster

3. Create SSH and update yaml

cd ~/.ssh/
kubectl create secret generic airflow-ssh-git-secret --from-file=gitSshKey=priv.key -n airflow-cluster

4. apply
helm upgrade --install airflow apache-airflow/airflow -n airflow-cluster -f values.yaml

5. Build image
docker build -t rajatonit/airflow-custom:1.0.0 .
docker login
docker push rajatonit/airflow-custom:1.0.0

6. Add key 
kubectl create -n airflow-cluster secret generic google-sa-key --from-file google_sa_key.json

7. Install Airflow
helm upgrade --install airflow apache-airflow/airflow -n airflow-cluster -f values.yaml
