resource "local_file" "ansible_inventory" {
  content = <<EOT
[gateway]
gateway_server ansible_host=${aws_eip.gateway_eip.public_ip}

[app]
app_server ansible_host=${aws_eip.appserver_eip.public_ip}

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=../terraform-aws/deployer-key.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOT
  filename = "${path.module}/../ansible/Inventory"
}
