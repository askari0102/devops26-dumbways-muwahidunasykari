resource "local_file" "ansible_inventory" {
  content = <<EOT
[gateway]
gateway_server ansible_host=${aws_eip.gateway_eip.public_ip} gateway_private_ip=${aws_instance.gateway_db.private_ip}

[app]
app_server ansible_host=${aws_eip.appserver_eip.public_ip} app_private_ip=${aws_instance.app_server.private_ip}

[monitoring]
monitoring_server ansible_host=${aws_eip.monitoring_eip.public_ip} monitoring_private_ip=${aws_instance.monitoring.private_ip}

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/deployer-key.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'

# Tetap pertahankan db_host untuk kebutuhan aplikasi backend
db_host=${aws_instance.gateway_db.private_ip}
EOT
  filename = "${path.module}/../ansible/Inventory"
}
