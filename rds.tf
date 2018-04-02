resource "aws_db_instance" "redmine" {
  allocated_storage    = "${var.rds_storage_capacity}"
  storage_type         = "${var.rds_storage_type}"
  engine               = "postgres"
  engine_version       = "${var.rds_version}"
  instance_class       = "db.t2.micro"
  name                 = "redmine"
  username             = "${var.rds_user}"
  password             = "${var.rds_pass}"
  skip_final_snapshot  = true
}


resource "aws_db_subnet_group" "redmine" {
  name       = "redmine"
  subnet_ids = ["${aws_security_group.redmine.id}"]

  tags {
    Name = "Redmine DB subnet group"
  }
}
