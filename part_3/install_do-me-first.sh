GREEN="\033[0;32m"
RED="\e[0;31m"
WHITE="\e[0;m"

#!/bin/bash
echo -e "$GREEN Starting script ...\n"

echo -e "$RED Installing DOCKER ... $WHITE"
sudo apt-get install docker -y

echo -e "$RED Installing KUBERNETES... $WHITE"
snap install kubectl --classic

echo -e "$RED Installing K3D ... $WHITE"
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo -e "$RED Installing ARGOCD ... $WHITE"
sudo apt-get install argocd -y

echo -e "$GREEN End of script ... $WHITE\n"
