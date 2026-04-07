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


