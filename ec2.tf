resource "aws_instance" "redmine" {
    count = 1
    ami = "ami-15e9c770"  // amzn-ami-hvm-2017.09.1.20171120-x86_64-gp2
    instance_type = "t2.small"
    tags {
        Name = "redmine"
      }
    subnet_id = "${aws_subnet.redmine.id}"
    private_ip = "${cidrhost("10.43.0.0/16", 10 + count.index)}"
    associate_public_ip_address = true

    availability_zone = "${var.availability_zone}"
    vpc_security_group_ids = ["${aws_security_group.redmine.id}"]
    key_name = "test"

    connection {
       type = "ssh"
       user = "ec2-user"
       private_key = "${file("./keys/test.pem")}"
    }

    provisioner "remote-exec" {
                  inline = [ "sudo yum install -y docker",
                            "sudo service docker start",
                            "sudo chkconfig docker on",
                            "docker run -d --name redmine-container -e REDMINE_DB_POSTGRES=${aws_db_instance.redmine.address} -e REDMINE_DB_PORT=${aws_db_instance.redmine.port} -e REDMINE_DB_USERNAME=${var.rds_user} -e REDMINE_DB_PASSWORD=${var.rds_pass} -e REDMINE_DB_DATABASE=redmine -p 3000:3000 --restart=always redmine"
                            ]
          }
      }
