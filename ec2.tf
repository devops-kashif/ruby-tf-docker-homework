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
    key_name = "my-key"
    public_key = "${var.public_key}"


      }
