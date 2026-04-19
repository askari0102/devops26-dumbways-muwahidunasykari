# Ngambil IP Publik Gateway Server
output "gateway_ip" {
  value       = aws_eip.gateway_eip.public_ip
}

# Ngambil IP Publik Appserver
output "app_server_ip" {
  value       = aws_eip.appserver_eip.public_ip
}

# Ngambil IP Publik Monitoring
output "monitoring_ip" {
  value = aws_eip.monitoring_eip.public_ip
}

# Ambil IP Private Gateway
output "gateway_private_ip" {
  value = aws_instance.gateway_db.private_ip
}

# Ambil IP Private Appserver
output "app_private_ip" {
  value = aws_instance.app_server.private_ip
}

# Ambil IP Private Monitoring
output "monitoring_private_ip" {
  value = aws_instance.monitoring.private_ip
}
