# Ngambil IP Gateway Server
output "gateway_ip" {
  value       = aws_eip.gateway_eip.public_ip
}

# Ngambil IP Appserver
output "app_server_ip" {
  value       = aws_eip.appserver_eip.public_ip
}

output "ssh_key_pem" {
  value     = tls_private_key.main.private_key_pem
  sensitive = true
}