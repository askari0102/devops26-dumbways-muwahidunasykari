# Ngambil IP Publik Gateway Server
output "gateway_ip" {
  value       = aws_eip.gateway_eip.public_ip
}

# Ngambil IP Publik Appserver
output "app_server_ip" {
  value       = aws_eip.appserver_eip.public_ip
}

# Ambil IP Private Gateway
output "gateway_private_ip" {
  value = aws_instance.gateway_server.private_ip
}

# Ambil IP Private Appserver
output "app_private_ip" {
  value = aws_instance.app_server.private_ip
}

output "ssh_key_pem" {
  value     = tls_private_key.main.private_key_pem
  sensitive = true
}
