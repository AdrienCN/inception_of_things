GREEN="\033[0;32m"
RED="\e[0;31m"
WHITE="\e[0;m"

#!/bin/bash
echo -e "$GREEN Starting script ...$WHITE\n"
sudo apt-get update -y && sudo apt-get upgrade -y

echo -e "$RED Installing DOCKER ... $WHITE"
#sudo snap install docker
sudo apt-get install docker curl

echo -e "$RED Installing KUBERNETES... $WHITE"
#snap install kubectl --classic
#sudo apt-get install -y kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0777 kubectl /usr/local/bin/kubectl

echo -e "$RED Installing K3D ... $WHITE"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash 
#echo -e "$RED Installing ARGOCD ... $WHITE"
#sudo apt-get install argocd -y

echo -e "$GREEN End of script ... $WHITE\n"
