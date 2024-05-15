# ansible-prometheus-grafana

Create terraform.tfvars in terraform folder

```hcl
region = "us-east-2"
vpc_cidr = "10.0.0.0/0"
subnet1_cidr = "10.0.1.0/0"
subnet2_cidr = "10.0.2.0/0"
subnet3_cidr = "10.0.3.0/0"
ip_on_launch = true
instance_type = "t2.micro"
```