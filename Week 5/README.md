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

6. Verify credentials by running `aws sts get-caller-identity`.
   <img width="630" height="132" alt="image" src="https://github.com/user-attachments/assets/f36baef5-3820-4dc2-b57c-14ba2ee3a8fa" />

7. Create new directory for terraform and move to the directory.
   <img width="544" height="30" alt="image" src="https://github.com/user-attachments/assets/eda83a0a-25e5-4fae-a2f5-01587301fa42" />
   <img width="675" height="47" alt="image" src="https://github.com/user-attachments/assets/8c4e3526-d773-4ee4-83c4-1bccb5e56afa" />

8. Create a new file called main.tf
```
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "server" {
    ami = "ami-0672fd5b9f0bdbefd"
    instance_type = "t3.small"

    tags = {
        Name = "terraform-server"
    }
}
```

9. Run `terraform init` to initialize provider.
   <img width="750" height="444" alt="image" src="https://github.com/user-attachments/assets/45c18873-fe11-4b96-b6a4-f1fb6cc34adb" />

10. Run `terraform plan -out=tfplan` to preview the plan for the infrastructures that will be created and save the plan to a new file
    <img width="930" height="220" alt="image" src="https://github.com/user-attachments/assets/3e8a012c-4e2e-455e-a8b0-5565ba86c475" />
    <img width="811" height="188" alt="image" src="https://github.com/user-attachments/assets/c1572b3c-79bd-4812-a97c-dca259be1ea5" />
    
 11. Run `terraform apply "tfplan"` to apply the saved plan. This will execute the actions proposed in the plan file and create the infrastructures.
     <img width="704" height="144" alt="image" src="https://github.com/user-attachments/assets/e83d7b72-46a0-4418-9d43-e4710a595fb0" />

12. Check your AWS. The created instances should be up and running
    <img width="1426" height="97" alt="image" src="https://github.com/user-attachments/assets/5f44b35f-441b-4110-8e6d-d118d4adcc00" />

    
