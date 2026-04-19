# Search Ubuntu ID
data "aws_ami" "ubuntu_22" {
  most_recent = true
  owners      = ["099720109477"] # ID Owner resmi Canonical (Ubuntu)
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
# Server 1: Nginx + DB
resource "aws_instance" "gateway_db" {
  ami           = data.aws_ami.ubuntu_22.id
  instance_type = "t3.small"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg_gateway_db.id]
  key_name      = aws_key_pair.main_key.key_name

  tags = { Name = "Gateway-DB-Server" }
}

# Server 2: Appserver
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu_22.id
  instance_type = "t3.small"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg_app.id]
  key_name = aws_key_pair.main_key.key_name

  tags = { Name = "App-Server" }
}

# Server 3: Monitoring (Prometheus + Grafana)
resource "aws_instance" "monitoring" {
  ami           = data.aws_ami.ubuntu_22.id
  instance_type = "t3.small" 
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.sg_monitoring.id]
  key_name      = aws_key_pair.main_key.key_name

  tags = { Name = "Monitoring-Server" }
}

# Elastic IP Server Gateway
resource "aws_eip" "gateway_eip" {
  domain   = "vpc"
  instance = aws_instance.gateway_db.id 

  tags = { Name = "gateway-db-eip" }
}

# Elastic IP Server Appserver
resource "aws_eip" "appserver_eip" {
  domain   = "vpc"
  instance = aws_instance.app_server.id

  tags = { Name = "app-server-eip" }
}

# Elastic IP Server Monitoring
resource "aws_eip" "monitoring_eip" {
  domain   = "vpc"
  instance = aws_instance.monitoring.id

  tags = { Name = "monitoring-eip" }
}
