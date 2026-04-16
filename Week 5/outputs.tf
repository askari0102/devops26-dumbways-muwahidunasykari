# Ngambil IP Publik Gateway Server
output "gateway_public_ip" {
  description = "Gunakan IP ini untuk SSH dari laptop"
  value       = aws_eip.gateway_eip.public_ip
}

# Ngambil IP Appserver
output "app_server_private_ip" {
  description = "IP ini hanya bisa diakses dari dalam VPC (lewat Gateway)"
  value       = aws_instance.app_server.private_ip
}

# Mengambil DNS S3 Bucket (jika kamu buat S3)
#output "s3_bucket_domain" {
#  value = aws_s3_bucket.app_storage.bucket_domain_name
#}