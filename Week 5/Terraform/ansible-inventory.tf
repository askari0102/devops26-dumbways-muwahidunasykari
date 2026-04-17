resource "local_file" "ansible_inventory" {
  content  = <<-EOT
    [gateway]
    gateway_server ansible_host=${aws_instance.gateway_server.public_ip} private_ip=${aws_instance.gateway_server.private_ip}

    [app]
    app_server ansible_host=${aws_instance.app_server.public_ip} private_ip=${aws_instance.app_server.private_ip}

    [all:vars]
    db_host=${aws_instance.gateway_server.private_ip}
  EOT
  filename = "../ansible/Inventory"
}
