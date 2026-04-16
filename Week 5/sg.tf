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

# Inbound Gateway SSH + HTTP
resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_gateway_db.id
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["X.X.X.X/24"] # IP Laptop
  security_group_id = aws_security_group.sg_gateway_db.id
}
# Inbound Appserver SSH
resource "aws_security_group_rule" "allow_ssh_app_from_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["X.X.X.X/24"] # IP Laptop 
  security_group_id = aws_security_group.sg_app.id
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
