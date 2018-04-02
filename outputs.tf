output "Redmine Address" {
  value = "http://${aws_instance.redmine.public_ip}:3000"
}
