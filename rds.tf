resource "aws_db_instance" "redmine" {
  depends_on           = ["aws_security_group.default"]
  allocated_storage    = "${var.rds_storage_capacity}"
  storage_type         = "${var.rds_storage_type}"
  engine               = "postgres"
  engine_version       = "${var.rds_version}"
  instance_class       = "db.t2.micro"
  name                 = "redmine"
  username             = "${var.rds_user}"
  password             = "${var.rds_pass}"
  skip_final_snapshot  = true
  vpc_security_group_ids = ["${aws_security_group.redmine.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.redmine.id}"
}

resource "aws_db_subnet_group" "redmine" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
}
