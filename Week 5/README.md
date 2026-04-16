1. Install Terraform in your local computer. I'm using WSL (Ubuntu).
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
```

2. Verify with `terraform -version`

<img width="467" height="64" alt="image" src="https://github.com/user-attachments/assets/eb4264a8-6e7a-41ef-80b8-95215886da24" />

3. Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

4. Create AWS Access Key by going to AWS Console → Security Credentials → Access keys → Create access key
<img width="1476" height="112" alt="image" src="https://github.com/user-attachments/assets/9512d5fe-7ea1-4275-bf99-fcb29257b00e" />

5. Setup credentials by running `aws configure`
```
AWS Access Key ID: (Enter your Access Key ID)
AWS Secret Access Key: (Enter your Secret Access Key)
Default region name: ap-southeast-1 (or your preferred region)
Default output format: json (or just press enter)
```

7. Verify credentials by running `aws sts get-caller-identity`.

8. Create new directory for terraform and move to the directory.
<img width="544" height="30" alt="image" src="https://github.com/user-attachments/assets/eda83a0a-25e5-4fae-a2f5-01587301fa42" />
<img width="675" height="47" alt="image" src="https://github.com/user-attachments/assets/8c4e3526-d773-4ee4-83c4-1bccb5e56afa" />

9. This repository contains Terraform configurations to deploy two Ubuntu 22.04 LTS instances:
- Gateway Server: Acts as an Nginx Reverse Proxy and Database Server.
- App Server: Acts as the application host (Frontend & Backend).
<pre>
.
├── 📄 <a href="./provider.tf"><b>provider.tf</b></a>      # AWS Provider configuration
├── 🌐 <a href="./vpc.tf"><b>vpc.tf</b></a>           # VPC, Subnet, IGW, and Routing
├── 🛡️ <a href="./sg.tf"><b>sg.tf</b></a>            # Security Group rules 
├── 🔑 <a href="./ssh.tf"><b>ssh.tf</b></a>           # Automated SSH Key Pair generation
├── 🖥️ <a href="./ec2.tf"><b>ec2.tf</b></a>           # EC2 Instance and Elastic IP 
└── 📤 <a href="./outputs.tf"><b>outputs.tf</b></a>       # Public IP outputs for ssh access
</pre>

10. Deploy
```
# Initialize Terraform and download providers
terraform init

# Review and save the execution plan 
terraform plan -out=tfplan

# Deploy the infrastructure from the saved plan
terraform apply "tfplan"
```
<img width="967" height="139" alt="image" src="https://github.com/user-attachments/assets/e4c409b0-9357-4811-abde-27bad5ebe8f7" />
<img width="969" height="322" alt="image" src="https://github.com/user-attachments/assets/3538095c-3d7b-4910-951f-9b55b8c84f13" />
<img width="944" height="208" alt="image" src="https://github.com/user-attachments/assets/10d34988-98d4-4134-8006-88f97d31c1c5" />


11. Check your AWS. The created instances should be up and running
<img width="1013" height="227" alt="image" src="https://github.com/user-attachments/assets/5730a7f0-62d0-426b-bd84-c72891f71122" />


12. Accessing the Servers
```
# Set correct file permissions
chmod 400 deployer-key.pem

# SSH into the Gateway Server
ssh -i deployer-key.pem ubuntu@<GATEWAY_PUBLIC_IP>

# SSH into the App Server
ssh -i deployer-key.pem ubuntu@<APP_SERVER_PUBLIC_IP>
```
<img width="967" height="336" alt="image" src="https://github.com/user-attachments/assets/993826d5-7432-4ef2-8087-26e3ba63c0c8" />
<img width="969" height="339" alt="image" src="https://github.com/user-attachments/assets/a9566fd0-e793-48c0-9fd0-6d076592a1c0" />

    
