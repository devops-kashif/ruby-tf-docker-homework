#  Containerised Redmine setup on AWS using Terraform with RDS

## Prerequities

- Terraform
- AWS CLI
- AWS KeyPair to be created and changed in the configuration
- Downloaded .PEM file need to be in root of the project

## Configuration

Edit terraform.tfvars variable with these options

```
aws_access_key="AKIAJRTXSXXXXXXXXXXXX"
aws_secret_key="XXXXXXXXXXXX2XmMQmYl46jOxvXXXX"
region="us-east-2"
availability_zone="us-east-2a"
rds_user="foo"
rds_pass="foobarbaaz"
rds_version="10.3"
rds_storage_type="gp2"
rds_storage_capacity="5"
```

Other relevant configuration will be asked on Runtime.

## Run

```terraform init```

```terraform plan```

```terraform apply```

## Test

Open Link of Host of EC2 Instance with port number 3000. You should see Redmine up and running! :)
