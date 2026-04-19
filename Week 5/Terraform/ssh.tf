# 1. Generate Private Key 
resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Daftarkan Public Key ke AWS
resource "aws_key_pair" "main_key" {
  key_name   = "deployer-key"
  public_key = tls_private_key.main.public_key_openssh
}

# 3. Simpan Private Key ke folder .ssh
resource "local_file" "ssh_key" {
  filename        = pathexpand("~/.ssh/deployer-key.pem")
  content         = tls_private_key.main.private_key_pem
  file_permission = "0400" # Supaya SSH nggak nolak karena permission terlalu terbuka
}
