resource "aws_security_group" "sg_gateway_db" {
  name   = "sg_gateway_db"
  vpc_id = aws_vpc.main.id
  tags   = { Name = "sg-gateway-db" }
}

resource "aws_security_group" "sg_app" {
  name   = "sg_app"
  vpc_id = aws_vpc.main.id
  tags   = { Name = "sg-app" }
}

resource "aws_security_group" "sg_monitoring" {
  name   = "sg_monitoring"
  vpc_id = aws_vpc.main.id
  tags   = { Name = "sg-monitoring" }
}

# Inbound Gateway SSH + HTTP
resource "aws_security_group_rule" "allow_http_gateway" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_gateway_db.id
}

resource "aws_security_group_rule" "allow_ssh_gateway" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # Terima semua IP untuk SSH
  security_group_id = aws_security_group.sg_gateway_db.id
}
# Inbound Appserver SSH
resource "aws_security_group_rule" "allow_ssh_app" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # Terima semua IP untuk SSH 
  security_group_id = aws_security_group.sg_app.id
}

# Rule SSH & Web Monitoring
resource "aws_security_group_rule" "allow_ssh_monitoring" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_monitoring.id
}

resource "aws_security_group_rule" "allow_prometheus_web" {
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id
  security_group_id = aws_security_group.sg_monitoring.id
}

resource "aws_security_group_rule" "allow_grafana_web" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id
  security_group_id = aws_security_group.sg_monitoring.id
}

# Integrasi 
resource "aws_security_group_rule" "allow_db_from_app" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_app.id 
  security_group_id        = aws_security_group.sg_gateway_db.id
}

resource "aws_security_group_rule" "allow_frontend_from_gateway" {
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id 
  security_group_id        = aws_security_group.sg_app.id
}

resource "aws_security_group_rule" "allow_backend_from_gateway" {
  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id 
  security_group_id        = aws_security_group.sg_app.id
}

# Outbound
resource "aws_security_group_rule" "gateway_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_gateway_db.id
}

resource "aws_security_group_rule" "app_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_app.id
}

resource "aws_security_group_rule" "monitoring_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_monitoring.id
}

# Izin Node Exporter untuk Monitoring
resource "aws_security_group_rule" "allow_node_exporter_self" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_monitoring.id # Dari dirinya sendiri
  security_group_id        = aws_security_group.sg_monitoring.id
}
# - Di Server Gateway
resource "aws_security_group_rule" "allow_node_exporter_gateway" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_monitoring.id
  security_group_id        = aws_security_group.sg_gateway_db.id
}

# - Di Server Appserver
resource "aws_security_group_rule" "allow_node_exporter_app" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_monitoring.id
  security_group_id        = aws_security_group.sg_app.id
}

# Izinkan Gateway untuk akses Node Exporter 
# 1. Izinkan Gateway akses port 9100 di Server App
resource "aws_security_group_rule" "allow_node_exporter_app_from_gateway" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id 
  security_group_id        = aws_security_group.sg_app.id
}

# 2. Izinkan Gateway akses port 9100 di Server Monitoring
resource "aws_security_group_rule" "allow_node_exporter_monitor_from_gateway" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id 
  security_group_id        = aws_security_group.sg_monitoring.id
}

# 3. Izinkan Gateway akses port 9100 ke DIRINYA SENDIRI (PENTING!)
resource "aws_security_group_rule" "allow_node_exporter_gateway_self" {
  type                     = "ingress"
  from_port                = 9100
  to_port                  = 9100
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg_gateway_db.id
  security_group_id        = aws_security_group.sg_gateway_db.id
}
