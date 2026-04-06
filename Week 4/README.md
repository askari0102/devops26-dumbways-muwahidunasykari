**Docker**

1. Install Docker with the script below

```
#!/bin/bash

echo "=== Removing all conflicting packages ==="
# Uninstall all conflicting packages
sudo apt remove $(dpkg --get-selections docker.io docker-compose docker-compose-v2 docker-doc podman-docker containerd runc | cut -f1)

echo "=== Install Docker Repo ==="
# Add Docker's official GPG key:
sudo apt update -y
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding Docker repository..."
# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources > dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Update again
sudo apt update -y

# Installing Docker
echo "=== Installing Docker ==="
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start and enable Docker
echo "=== Starting Docker Service ==="
sudo systemctl start docker
sudo systemctl enable docker

# Verification
echo "Checking Docker's version..."
docker --version 
