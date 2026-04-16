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
.
├── [provider.tf](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/provider.tf)      # AWS Provider configuration
├── [vpc.tf](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/vpc.tf)           # VPC, Subnet, Internet Gateway, and Routing 
├── [sg.tf](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/sg.tf)            # Security Group rules 
├── [ssh.tf](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/ssh.tf)           # Automated SSH Key Pair generation 
├── [ec2.tf ](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/ec2.tf)          # EC2 Instance definitions and Elastic IP associations
├── [outputs.tf](https://github.com/askari0102/devops26-dumbways-muwahidunasykari/blob/main/Week%205/outputs.tf)       # Public IP outputs
└── .gitignore       # Protection for sensitive files (*.pem, .tfstate)

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
<img width="1426" height="97" alt="image" src="https://github.com/user-attachments/assets/5f44b35f-441b-4110-8e6d-d118d4adcc00" />

    
