sudo k3d cluster create "adconsta" -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
sleep 3

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo -e "creating the argocd\n"
sudo kubectl apply -f ../conf/install.yaml -n argocd
sleep 3
echo -e "Waiting for pods to be ready\n"
sudo kubectl wait -n argocd --for=condition=Ready pods --all
sleep 3

echo -e "creating the ingress\n"
sudo kubectl apply -f ../conf/ingress.yaml -n argocd
sleep 3

#echo -e "creating the project\n"
#sudo kubectl apply -f ../conf/project.yaml -n argocd
#sleep 3

echo -e "creating the wil app\n"
sudo kubectl apply -f ../conf/application.yaml -n argocd
