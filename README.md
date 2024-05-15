# ansible-prometheus-grafana

Create AWS access and secret key with right permissions to create vpc and ec2
Run
`export AWS_ACCESS_KEY_ID="your_access_key"`
`export AWS_SECRET_ACCESS_KEY="your_secret_access_key"`

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