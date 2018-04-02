resource "aws_vpc" "redmine" {
  cidr_block = "10.43.0.0/16"
  enable_dns_hostnames = true
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.redmine.id}"
}

resource "aws_route_table" "redmine" {
    vpc_id = "${aws_vpc.redmine.id}"
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
    }
}

resource "aws_route_table_association" "redmine" {
  subnet_id = "${aws_subnet.subnet_1.id}"
  route_table_id = "${aws_route_table.redmine.id}"
}

resource "aws_security_group" "redmine" {
  name        = "redmine"
  description = "Allow 3000 port"
  vpc_id      = "${aws_vpc.redmine.id}"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.43.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
