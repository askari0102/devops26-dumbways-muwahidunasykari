# Ngambil IP Gateway Server
output "gateway_public_ip" {
  description = "Gunakan IP ini untuk SSH dari laptop"
  value       = aws_eip.gateway_eip.public_ip
}

# Ngambil IP Appserver
output "app_server_public_ip" {
  description = "Gunakan IP ini untuk SSH dari laptop"
  value       = aws_eip.appserver_eip.public_ip
}

