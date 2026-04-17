# 1. VPC Utama
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags                 = { Name = "main-vpc" }
}

# 2. Internet Gateway (Pintu keluar-masuk internet)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "main-igw" }
}

# 3. Public Subnet 
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-southeast-1a"
  tags                    = { Name = "public-subnet" }
}

# 4. Route Table 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" # Semua traffic yang tujuannya ke internet . . .
    gateway_id = aws_internet_gateway.igw.id # . . . Harus lewat Internet Gateway
  }

  tags = { Name = "public-route-table" }
}

# 5. Hubungkan Subnet ke Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}