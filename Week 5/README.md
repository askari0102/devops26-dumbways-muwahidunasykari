### **Creating Infrastructure with Terraform**

---------------
**1. Install Terraform in your local computer. I'm using WSL (Ubuntu).**
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

**2. Verify with `terraform -version`**

<img width="467" height="64" alt="image" src="https://github.com/user-attachments/assets/eb4264a8-6e7a-41ef-80b8-95215886da24" />

**3. Install AWS CLI**
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**4. Create AWS Access Key by going to AWS Console → Security Credentials → Access keys → Create access key**
<img width="1476" height="112" alt="image" src="https://github.com/user-attachments/assets/9512d5fe-7ea1-4275-bf99-fcb29257b00e" />

**5. Setup credentials by running `aws configure`**
```
AWS Access Key ID: (Enter your Access Key ID)
AWS Secret Access Key: (Enter your Secret Access Key)
Default region name: ap-southeast-1 (or your preferred region)
Default output format: json (or just press enter)
```

**6. Verify credentials by running `aws sts get-caller-identity`.**

**7. Create new directory for terraform and move to the directory.**
<img width="544" height="30" alt="image" src="https://github.com/user-attachments/assets/eda83a0a-25e5-4fae-a2f5-01587301fa42" />
<img width="675" height="47" alt="image" src="https://github.com/user-attachments/assets/8c4e3526-d773-4ee4-83c4-1bccb5e56afa" />

**8. This repository contains Terraform configurations to deploy two Ubuntu 22.04 LTS instances:**
- Gateway Server: Acts as an Nginx Reverse Proxy and Database Server.
- App Server: Acts as the application host (Frontend & Backend).
<pre>
terraform/
├── 📄 <a href="./Terraform/provider.tf"><b>provider.tf</b></a>            # AWS Provider configuration
├── 🌐 <a href="./Terraform/vpc.tf"><b>vpc.tf</b></a>                 # VPC, Subnet, IGW, and Routing
├── 🛡️ <a href="./Terraform/sg.tf"><b>sg.tf</b></a>                  # Security Group rules 
├── 🔑 <a href="./Terraform/ssh.tf"><b>ssh.tf</b></a>                 # Automated SSH Key Pair generation
├── 🖥️ <a href="./Terraform/ec2.tf"><b>ec2.tf</b></a>                 # EC2 Instance and Elastic IP 
├── 📄 <a href="./Terraform/ansible-inventory.tf"><b>ansible-inventory.tf</b></a>   # Automatically create Inventory file for Ansible
└── 📤 <a href="./Terraform/outputs.tf"><b>outputs.tf</b></a>             # Public IP outputs for ssh access
</pre>

**9. Deploy**
```
# Initialize Terraform and download providers
terraform init

# Review and save the execution plan 
terraform plan -out=tfplan

# Deploy the infrastructure from the saved plan
terraform apply "tfplan"
```
<img width="967" height="139" alt="image" src="https://github.com/user-attachments/assets/e4c409b0-9357-4811-abde-27bad5ebe8f7" />
<img width="1361" height="408" alt="image" src="https://github.com/user-attachments/assets/7b808b11-3dc0-4a02-9f2d-919dadb0241a" />
<img width="1362" height="405" alt="image" src="https://github.com/user-attachments/assets/3ffadf10-c552-41fc-abfd-9d68c7d67f20" />


**10. Check your AWS. The created instances should be up and running**
<img width="947" height="153" alt="image" src="https://github.com/user-attachments/assets/10b0a626-3603-4feb-8373-108c468549ff" />


**11. Preview and execute infrastructure destruction with `terraform destroy`.**
<img width="965" height="332" alt="image" src="https://github.com/user-attachments/assets/13e89742-dfa5-47b2-b999-b5f6d4b4d8d2" />
<img width="956" height="37" alt="image" src="https://github.com/user-attachments/assets/5f159a95-52da-4398-81e0-35903584ca5f" />


### **Ansible**

-----------
**1. Install pipx**
```
sudo apt update
sudo apt install pipx
pipx ensurepath
```
<img width="759" height="40" alt="image" src="https://github.com/user-attachments/assets/5f4bbd2a-97e3-4e7a-8f6c-16ddb7615104" />

**2. Install Ansible with pipx**
```
pipx install --include-deps ansible # Run this if you want to install the full Ansible package
pipx install ansible-core           # Run this if you want the minimal ansible-core package
```
<img width="672" height="44" alt="image" src="https://github.com/user-attachments/assets/0d62df09-be0e-439b-804f-cdb7662870ed" />

**3. Create a new directory for the ansible configs and move into that directory**
<img width="670" height="43" alt="image" src="https://github.com/user-attachments/assets/6cc47868-5566-4d0d-bfa1-5e3189ee23b6" />

**4. This repository contains Ansible configurations to deploy frontend and backend to Appserver and setup webserver and db in Gateway Server.**
<pre>
ansible/
├── ⚙️ <a href="./ansible/ansible.cfg">ansible.cfg</a>          # Ansible config settings
├── 🚀 <a href="./ansible/main.yaml">main.yaml</a>            # Main playbook to run everything
├── 📦 <a href="./ansible/setup_app.yaml">setup_app.yaml</a>       # App server setup
├── 🛡️ <a href="./ansible/setup_gateway.yaml">setup_gateway.yaml</a>  # Gateway and Database setup
├── 📈 <a href="./ansible/setup_monitoring.yaml">setup_monitoring.yaml</a> # Monitoring (Prometheus & Grafana) setup
├── 🛠️ <a href="./ansible/setup_base.yaml">setup_base.yaml</a>      # Base setup: Docker, User, and Node Exporter for all servers
├── 📂 <b>group_vars/</b>
│   └── 🔧 <a href="./ansible/group_vars/all">all</a>               # Global variables 
├── 📂 <b>templates/</b>
│   ├── 📄 <a href="./ansible/templates/wayshub.j2">wayshub.j2</a>        # Nginx config template
│   ├── 📄 <a href="./ansible/templates/frontend-env.j2">frontend-env.j2</a>   # Frontend .env template
│   ├── 📄 <a href="./ansible/templates/prometheus.j2">prometheus.j2</a>     # Prometheus scrape targets config# Frontend .env template
│   └── 📄 <a href="./ansible/templates/docker-compose.j2">docker-compose.j2</a> # Docker Compose template for Monitoring
├── 📑  Inventory            # Server list (from Terraform output)
└── 🔐 <a href="./ansible/.vault_pass">.vault_pass</a>          # Ansible Vault password
</pre>
To encrypt your passwords, run the commands below. Copy the results to group_vars/all
```
python3 -c 'import crypt; print(crypt.crypt("passworduser", crypt.mksalt(crypt.METHOD_SHA256)))' # For user's password
ansible-vault encrypt_string 'password_db_asli' --vault-id default@.vault_pass --name 'db_password' # For db's password. If you get an error then remove the `vault_password_file = .vault_pass` line from the ansible.cfg first, then add it again after you ran the command.
```
**5. Create DNS records on Cloudflare** 
<img width="1415" height="407" alt="image" src="https://github.com/user-attachments/assets/cbe1c9db-a728-45d3-b25b-e1d053baeebe" />

**6. Run Ansible with `ansible-playbook main.yaml`**
<img width="1361" height="392" alt="image" src="https://github.com/user-attachments/assets/60ce2adb-9dd4-4f7e-86bf-9cda6fbf9f3c" />

**7. Accessing the servers**
```
ssh -i ~/.ssh/deployer-key.pem <new_user>@<SERVER_PUBLIC_IP> # Replace <SERVER_PUBLIC_IP> with the actual IP address of the Gateway, App, or Monitoring server.
```

**8. Visit the main domain in your browser to start using the app. The website is fully operational, including the registration and login systems.**
<img width="1919" height="939" alt="image" src="https://github.com/user-attachments/assets/6630f511-5343-4ee9-a9ad-7abd77aa4647" />

### **Monitoring with Prometheus & Grafana**

------

**1. Connecting Prometheus to Grafana**
  - Go to Connections > Data Sources > Add Prometheus.
  - Set URL to: http://prometheus:9090 (using Docker Service Name).
  - Click Save & Test.
<img width="1919" height="1004" alt="image" src="https://github.com/user-attachments/assets/d29b3945-c7a4-411e-82a5-9e0069f7b7d4" />
<img width="1547" height="330" alt="image" src="https://github.com/user-attachments/assets/e0b38272-114a-4486-8804-611cdbba6852" />

**2. Create & Configure Panel**
  - Click + > Dashboard > Add Panel > Configure Visualization.
  - Select Prometheus as the source.
  - Set Query: Switch the toggle from "Builder" to Code, then paste the the query and click run query.

| Metric | PromQL Query | Unit | Threshold |
| :--- | :--- | :--- | :--- |
| **CPU Usage** | `100 - (avg by (alias) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)` | Percent (%) | > 20%  |
| **RAM Usage (%)** | `(1 - (avg by (alias) (node_memory_MemAvailable_bytes) / avg by (alias) (node_memory_MemTotal_bytes))) * 100` | Percent (%) | > 75% |
| **RAM Usage (GB)** | `avg by (alias) (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / 1024 / 1024` | Gigabytes | > 1.5GB (Warning) |
| **Disk Usage (GB)** | `avg by (alias) (node_filesystem_size_bytes{mountpoint="/"} - node_filesystem_avail_bytes{mountpoint="/"}) / 1024 / 1024 / 1024` | Gigabytes | > 6.5GB  |

**3. Visualization & Refinement**
- Select Visualization: Choose your preferred type (Gauge, Bar Gauge, or Time Series).
- Standard Options:
  * Set the Unit according to the chosen table (e.g., Megabytes, Percent, etc.).
  * Define Min/Max values to ensure the scale reflects your actual hardware capacity (e.g., Max: 7.6 for Disk).
- Thresholds: Configure color-coded indicators (Green, Yellow, Red) based on the threshold values to provide quick visual alerts.
- Data Filtering: Use the Transform tab > Filter data by name if you need to remove "ghost" series or unwanted query results from the view.
<img width="1919" height="849" alt="image" src="https://github.com/user-attachments/assets/0055639d-5c25-43b7-a0dd-0448c3619501" />
<img width="1919" height="834" alt="image" src="https://github.com/user-attachments/assets/7831086b-4c1b-4ad9-a975-ac9cde418507" />
<img width="1919" height="906" alt="image" src="https://github.com/user-attachments/assets/310e13fe-4272-420c-bd06-542d8cb5d5d8" />
<img width="1919" height="967" alt="image" src="https://github.com/user-attachments/assets/3b7333ed-f1ca-4ec8-a38c-be51a6b38a0f" />

**4. Set as Home Dashboard**
- Go to Profile (bottom-left) > Preferences.
- Select your dashboard in the Home Dashboard dropdown.
- Click Save.
- Auto-Refresh: Set to 5s (top right).
<img width="1504" height="607" alt="image" src="https://github.com/user-attachments/assets/0f9bbc0e-f769-4545-8491-4434dea548bf" />
<img width="1919" height="916" alt="image" src="https://github.com/user-attachments/assets/33469b30-fb0e-4c12-9b15-d5205213bbf9" />

**5. Discord Alerting Setup**
- Create Discord Webhook
  * Open your Discord server and go to Server Settings > Integrations.
  * Click Webhooks > New Webhook.
  * Name it and select the channel.
  * Click Copy Webhook URL.
  <img width="872" height="223" alt="image" src="https://github.com/user-attachments/assets/cd206640-6d2c-436c-81c2-a5f3a69c8fa2" />

- Configure Contact Point in Grafana
  * Navigate to Alerting > Contact points.
  * Click _New contact point_.
  * Name: Discord-Alerts.
  * Integration: Select Discord.
  * Webhook URL: Paste the URL from Discord.
  * Apply Template In Message Content if you want (optional).
  * Click Test to ensure a notification arrives, then Save.
  <img width="1919" height="368" alt="image" src="https://github.com/user-attachments/assets/fdd3d291-56a2-42fe-940c-4066143f45a7" />
  <img width="1919" height="820" alt="image" src="https://github.com/user-attachments/assets/544075d9-61a9-45e5-9ef0-1b7554dcfa10" />
  <img width="936" height="348" alt="image" src="https://github.com/user-attachments/assets/dd73d05d-267b-4e9c-956e-4e32c55a9ff2" />
  <img width="1444" height="497" alt="image" src="https://github.com/user-attachments/assets/c13b2da7-8757-41e3-bfe7-73a1d24c599e" />

- Create Alert Rule
  * Open the panel in the dashboard → click ⋮ (3 dots) on the top right corner of the panel → More → New alert rule
  * Define Query and Condition
    - Query is automatically filled from the panel. Add Threshold, set it to your desired limit (e.g., 20 for CPU, 75 for RAM).
  * Set Evaluation Behavior
    - Folder: Create a new folder named `Server Alerts`.
    - Evaluation group: Create a group named `1m-interval` with a 1m interval.
    - Pending period (For): Set to 5m (Wait 5 minutes of sustained high usage before firing).
  * Add Details & Notifications
    - Summary: High X Usage on {{ $labels.alias }}.
    - Description: X usage is at {{ printf "%.1f" $values.A.Value }}% on server {{ $labels.alias }}. 
    - Notifications: Select Discord-Alerts as the contact point.
  * Click Save rule and exit.
  <img width="1919" height="912" alt="image" src="https://github.com/user-attachments/assets/ea81efb0-0131-43bc-8d98-a4227e77a03a" />

- Testing the Alert
  * Manual Threshold Trigger: Edit an alert rule and temporarily lower the threshold (e.g., set CPU Alert to Above 1 %). Once the status changes to Firing and sends a Discord notification, revert the threshold     to its original value.
  <img width="1114" height="357" alt="image" src="https://github.com/user-attachments/assets/20998595-4213-4c90-82a5-81a0be11da17" />
  <img width="1097" height="409" alt="image" src="https://github.com/user-attachments/assets/4fa9fe17-b490-4809-a09c-472c9570bc8b" />





