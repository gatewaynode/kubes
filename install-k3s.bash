# Run inline with `source`

echo "Get the distribution from get.k3s.io"
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644
echo "Create home .kube folder and copy YAML config to .kube/"
mkdir ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/k3s-config
# Set it also in the bashrc or zshrc file, or you can flatten both of these configs into a single file
echo "Set the environment variable for k3s"
# export KUBECONFIG="~/.kube/config:~/.kube/k3s-config"
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/k3s-config"

# sudo k3s server &
# # Kubeconfig is written to /etc/rancher/k3s/k3s.yaml
# sudo k3s kubectl get node
# 
# # On a different node run the below. NODE_TOKEN comes from /var/lib/rancher/k3s/server/node-token
# # on your server
# sudo k3s agent --server https://myserver:6443 --token ${NODE_TOKEN}

# Install Helm
# NOTE: See if there is a latest link
echo "Installing Helm:"
wget https://get.helm.sh/helm-v3.9.0-linux-amd64.tar.gz
tar -xvvzf helm-v3.9.0-linux-amd64.tar.gz 
echo "Moving binary to path"
sudo mv linux-amd64/helm /usr/local/bin/
