**Docker**

1. Install Docker with the script below
```
#!/bin/bash
  
echo " === Removing all conflicting packages ==="
# Uninstall all conflicting packages
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)
  
# Add Docker's GPG key
echo " === Adding Docker's GPG key ==="
curl -fsSL  https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o  /usr/share/keyrings/docker-archive-keyring.gpg
  
# Add Docker repository to Apt sources
echo " === Adding Docker repository to Apt Sources ==="
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
# Update package list and install necessary dependencies
echo " === Updating package list === "
sudo apt update -y
echo " === Installating dependencies ==== "
sudo apt install -y ca-certificates curl
  
# Securely add docker's key to keyrings
echo " === Adding Docker's key securely ===="
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
  
# Add the repository to Apt with the new key
echo "=== Adding Docker repository with the new key ==="
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
# Update package list again
sudo apt  update -y

# Installing Docker
echo "=== Installing Docker ==="
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker
echo "=== Starting Docker Service ==="
sudo systemctl start docker
sudo systemctl enable docker
  
# Verification
echo " === Verifying Docker Installation ==="
docker --version
```
2. Add user to docker group and log in to the new docker group with `sudo usermod -aG docker $USER` and `newgrp docker`. Check if Docker can be run without root by running `docker run hello-world`.
   <img width="977" height="291" alt="image" src="https://github.com/user-attachments/assets/ab90a899-69fe-4d9c-9f3e-98e15b126ad1" />

**Production**

1. Create new docker user and login with the new user.
   <img width="825" height="35" alt="image" src="https://github.com/user-attachments/assets/247470d1-a6f0-4362-8d24-78ffffcc9029" />
   <img width="944" height="52" alt="image" src="https://github.com/user-attachments/assets/79f30130-023d-4700-950b-057aa5f244c3" />
   <img width="729" height="36" alt="image" src="https://github.com/user-attachments/assets/8265fc48-9d44-476a-8a87-f1b2b0188be2" />

2. Make a new directory for the app, then clone the frontend and the backend
   <img width="1251" height="492" alt="image" src="https://github.com/user-attachments/assets/94deb1be-7139-4daa-8265-87819f3a25d0" />

3. Make "Dockerfile" for both the frontend and the backend.
   <img width="1147" height="393" alt="image" src="https://github.com/user-attachments/assets/12a50ad9-bafb-41af-ad3c-da719cb4d6b0" />

4. Set config to connect frontend to backend, and the backend to database.
   <img width="896" height="428" alt="image" src="https://github.com/user-attachments/assets/52251c28-b6eb-4f0e-a262-00b3289cd15a" />
   <img width="415" height="184" alt="image" src="https://github.com/user-attachments/assets/e231d5e7-f40c-456c-b421-281b236a8196" />

5. Build the frontend and the backend.
   <img width="1470" height="224" alt="image" src="https://github.com/user-attachments/assets/32cc979c-d3f4-4ac3-9a6e-7cae57713b5e" />
   <img width="1472" height="232" alt="image" src="https://github.com/user-attachments/assets/0243b90b-e2f8-42c4-b644-c8cadf0895ed" />

6. Make a new docker-compose.yml and the .env for the backend
   <img width="925" height="575" alt="image" src="https://github.com/user-attachments/assets/9e3b916d-8286-4238-9fff-3f4e57ffa61d" />
   <img width="796" height="172" alt="image" src="https://github.com/user-attachments/assets/fb79aba0-0aa8-48ee-a01e-8de13f9aca74" />


7. Make .conf file for the web server/nginx
   <img width="819" height="602" alt="image" src="https://github.com/user-attachments/assets/79219269-44ed-4418-a848-6d1e281b9ee9" />

8. Run docker compose
   <img width="1478" height="260" alt="image" src="https://github.com/user-attachments/assets/f71f226b-3ffa-400f-9078-5a0bf7c8aa7b" />

