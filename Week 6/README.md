## **Orchestration with Kubernetes**

----
### **Setup k3s Kubernetes cluster**

**1. Prepare Three Servers Using Terraform.**
* Provision one master node and two worker nodes on AWS using Terraform.
<img width="977" height="412" alt="image" src="https://github.com/user-attachments/assets/b110b67a-a99a-4c87-9fd9-83736c4b705d" />
<img width="984" height="281" alt="image" src="https://github.com/user-attachments/assets/5573657f-8acc-43ab-9840-62e9038cafc8" />

**2. k3s Installation**

* Ensure all nodes have unique hostnames before proceeding.
* Install k3s on the master node as root with `curl -sfL https://get.k3s.io | sh -`
<img width="1472" height="470" alt="image" src="https://github.com/user-attachments/assets/fdc8c358-53d5-4a22-9563-b3dca9a64812" />

* Add the k3s binary to PATH so you don't need to specify the full path every time with `export PATH=/usr/local/bin:$PATH`
<img width="964" height="102" alt="image" src="https://github.com/user-attachments/assets/523ca37d-d5b3-438d-99b3-062ab5b84124" />

* Retrieve the master's token with `cat /var/lib/rancher/k3s/server/token` and copy the output
<img width="1474" height="53" alt="image" src="https://github.com/user-attachments/assets/605c3ceb-9e71-4a6d-bb2b-8fbeb6b1d9d6" />

* Install k3s on each worker node with the command below. Use the master's private IP if all nodes are in the same VPC.
`curl -sfL https://get.k3s.io | K3S_URL=https://<MASTER_PRIVATE_IP>:6443 K3S_TOKEN=<TOKEN> sh -`
<img width="1477" height="439" alt="image" src="https://github.com/user-attachments/assets/f57a2d6d-0c05-451b-8111-e96a543dc5b6" />
<img width="1477" height="446" alt="image" src="https://github.com/user-attachments/assets/267f681c-8af8-45db-9a0e-6daf19c1ba17" />

* Verify all nodes are joined and ready with `kubectl get nodes` on master.
<img width="702" height="113" alt="image" src="https://github.com/user-attachments/assets/6b275d3f-708c-4f7e-a304-f5ab2af6aee1" />

**3. Helm Installation**

* Install Helm on the master node using the official install script
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
chmod 700 get_helm.sh
./get_helm.sh
```
<img width="1465" height="167" alt="image" src="https://github.com/user-attachments/assets/7fb254a6-a3d1-4a77-9cb0-db6ebdb2e4ee" />
* Point Helm to the k3s cluster by exporting the kubeconfig
  - Navigate to the k3s directory `cd /etc/rancher/k3s` and confirm `k3s.yaml` is present.
  <img width="1919" height="881" alt="image" src="https://github.com/user-attachments/assets/1533a381-6b86-4ef8-8cd7-3bacdf1bd6c6" />
  - Export the kubeconfig `export KUBECONFIG=/etc/rancher/k3s/k3s.yaml`
  <img width="1090" height="36" alt="image" src="https://github.com/user-attachments/assets/977510e5-e7ab-4509-894a-7b2bb71193e5" />
* Helm is ready to use
<img width="1011" height="50" alt="image" src="https://github.com/user-attachments/assets/48dffb54-6db7-42ba-8b19-f7e8bb5d1a00" />

**4. Replacing Traefik Ingress with NGINX Ingress**

* Confirm Traefik is currently installed with `helm ls -n kube-system`
<img width="1919" height="100" alt="image" src="https://github.com/user-attachments/assets/b0b3e19c-0aea-432a-b522-1a7af156ba70" />
* Navigate to the manifests directory `cd /var/lib/rancher/k3s/server/manifests` and remove the traefik manifest  to prevent k3s from re-deploying it on restart `rm -rf traefik.yaml`
<img width="1369" height="171" alt="image" src="https://github.com/user-attachments/assets/99a6929f-8215-44bd-be19-0549928f7be9" />
* Uninstall Traefik with `helm uninstall traefik traefik-crd -n kube-system`
<img width="1802" height="210" alt="image" src="https://github.com/user-attachments/assets/089f6ebe-7a43-4aa9-b82f-68b9de1237f4" />

**5. Remote Cluster from Local Computer**

* Install kubectl on local computer
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```
<img width="1919" height="215" alt="image" src="https://github.com/user-attachments/assets/6e634f2e-dea2-4d4d-930e-3e9db14dd330" />
* Copy the k3s config from root to home temporarily
```
sudo cp /etc/rancher/k3s/k3s.yaml /home/ubuntu/k3s.yaml
sudo chown ubuntu:ubuntu /home/ubuntu/k3s.yaml
```
<img width="889" height="51" alt="image" src="https://github.com/user-attachments/assets/3cc192bb-ed07-4262-a248-d4f939eeecfb" />
* On your local computer, retrieve the config file from master. Note that master here refers to the SSH host alias already configured in ~/.ssh/config
```
mkdir -p ~/.kube
scp master:~/k3s.yaml ~/.kube/config
# Change to master's public IP
sed -i 's/127.0.0.1/<MASTER_IP>/g' ~/.kube/config
```
<img width="1919" height="68" alt="image" src="https://github.com/user-attachments/assets/92b41482-678d-4343-94cf-bb35af0c2278" />
<img width="1919" height="24" alt="image" src="https://github.com/user-attachments/assets/cfd4ed01-aaad-486c-aa62-dc4baf897a40" />
<img width="1037" height="20" alt="image" src="https://github.com/user-attachments/assets/6ca18c8f-02d9-445d-8377-57687eb928c9" />

* On master, add the public IP to tls-san so the TLS certificate accepts connections from outside the VPC
```
cd /etc/rancher/k3s
echo "tls-san:
  - <MASTER_EIP>" | sudo tee /etc/rancher/k3s/config.yaml
```
<img width="1662" height="282" alt="image" src="https://github.com/user-attachments/assets/201bda3a-69f7-4866-a4e4-395b44234cc5" />

* Delete the old certificate and restart k3s to regenerate it 
```
rm /var/lib/rancher/k3s/server/tls/server-ca.crt
rm /var/lib/rancher/k3s/server/tls/serving-kube-apiserver.crt
rm /var/lib/rancher/k3s/server/tls/serving-kube-apiserver.key
systemctl restart k3s
<img width="1477" height="97" alt="image" src="https://github.com/user-attachments/assets/789a9620-6679-44bd-8a61-1b98556ba491" />
```
* Verify the cluster is accessible from local computer `kubectl get nodes`
<img width="1642" height="122" alt="image" src="https://github.com/user-attachments/assets/d7b14e07-1b8f-4ae9-bd8e-d4c6e950fc87" />


