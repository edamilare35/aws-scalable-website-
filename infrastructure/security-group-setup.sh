```sh
#!/bin/bash

# Create a security group
aws ec2 create-security-group --group-name web-sg --description "Web server security group"

# Add inbound rules to the security group
aws ec2 authorize-security-group-ingress --group-name web-sg --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name web-sg --protocol tcp --port 22 --cidr 0.0.0.0/0
```