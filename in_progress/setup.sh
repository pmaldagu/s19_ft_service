echo "###############"
echo "#####START#####"
echo "###############"
minikube stop
minikube delete --all
minikube start #--extra-config=apiserver.service-node-port-range=1-6000 => reserve les ports
echo "\nAcces cluster\n"
minikube kubectl -- get po -A #new cluster
echo "\nLaunch the dashboard\n"
minikube dashboard & #lance le dashboarde
echo "\nReuse the Docker daemon from Minikube"
eval $(minikube docker-env)
echo "Build nginx image"
#docker image prune
docker build -t my_nginx ./nginx/
docker build -t my_word ./wordpress/
docker build -t my_php ./phpmyadmin/
echo "Deployement of docker image"
#kubectl create deployment my_minikube
kubectl run nginx-deployement --image=my_nginx:latest --image-pull-policy=Never
kubectl run word-deployement --image=my_word:latest --image-pull-policy=Never
kubectl run php-deployement --image=my_php:latest --image-pull-policy=Never
kubectl expose deployment nginx-deployement --type=NodePort --port=80 --target-port=443
kubectl expose deployment word-deployement --type=NodePort --port=5050
kubectl expose deployment php-deployement --type=NodePort --port=5000
minikube service list
