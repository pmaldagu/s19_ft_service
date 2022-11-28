minikube delete --all

minikube start --driver=virtualbox --memory='3000' --disk-size 10000MB

minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

minikube dashboard &

eval $(minikube docker-env)

kubectl apply -f ./srcs/metallb.yaml

docker build -t influxdb-image ./srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml
docker build -t wordpress-image ./srcs/wordpress/
docker build -t mysql-image ./srcs/mysql/
docker build -t phpmyadmin-image ./srcs/phpmyadmin/

kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t nginx-image	./srcs/nginx/
docker build -t grafana-image ./srcs/grafana/
docker build -t ftps-image ./srcs/ftps/


kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/ftps/ftps.yaml

kubectl get svc
