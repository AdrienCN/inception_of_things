sudo k3d cluster create "adconsta" -p 8080:80@loadbalancer -p 8888:30888@loadbalancer
sleep 3

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo "creating the argocd"
sudo kubectl apply -n argocd -f ../conf/argo_install.yaml 
sleep 3

sudo kubectl wait -n argocd --for=condition=Ready pods --all
sleep 3

echo "creating the ingress"
sudo kubectl apply -n argocd -f ../conf/argo_install.yaml
sleep 3

sudo kubectl apply -n argocd -f ../conf/project.yaml
sleep 3

echo "creating the wil app"
sudo kubectl apply -f ../conf/application.yaml -n argocd
