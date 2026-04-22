## **Orchestration with Kubernetes**

----
### **Setup k3s Kubernetes**

**1. Prepare three servers, one for Master node and two for worker nodes, using Terraform.**

<img width="977" height="412" alt="image" src="https://github.com/user-attachments/assets/b110b67a-a99a-4c87-9fd9-83736c4b705d" />
<img width="984" height="281" alt="image" src="https://github.com/user-attachments/assets/5573657f-8acc-43ab-9840-62e9038cafc8" />

**2. k3s Installation**

* Make sure your nodes have unique hostnames
* Install k3s as root on master node with `curl -sfL https://get.k3s.io | sh -`
<img width="1472" height="470" alt="image" src="https://github.com/user-attachments/assets/fdc8c358-53d5-4a22-9563-b3dca9a64812" />

* Export path so you don't have to type k3s every time with `export PATH=/usr/local/bin:$PATH`
<img width="964" height="102" alt="image" src="https://github.com/user-attachments/assets/523ca37d-d5b3-438d-99b3-062ab5b84124" />

* Get master's token with `cat /var/lib/rancher/k3s/server/token` and copy the output
<img width="1474" height="53" alt="image" src="https://github.com/user-attachments/assets/605c3ceb-9e71-4a6d-bb2b-8fbeb6b1d9d6" />

* Install k3s on worker nodes with `curl -sfL https://get.k3s.io | K3S_URL=https://<MASTER_IP>:6443 K3S_TOKEN=<TOKEN> sh -` Use private IP if all your nodes are in the same VPC
<img width="1477" height="439" alt="image" src="https://github.com/user-attachments/assets/f57a2d6d-0c05-451b-8111-e96a543dc5b6" />
<img width="1477" height="446" alt="image" src="https://github.com/user-attachments/assets/267f681c-8af8-45db-9a0e-6daf19c1ba17" />

* Check if everything's working correctly with `kubectl get nodes` on master.
<img width="702" height="113" alt="image" src="https://github.com/user-attachments/assets/6b275d3f-708c-4f7e-a304-f5ab2af6aee1" />
