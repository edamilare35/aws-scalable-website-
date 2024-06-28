```sh
#!/bin/bash

# Create a load balancer
aws elbv2 create-load-balancer --name web-lb --subnets subnet-0123456789abcdef0 subnet-abcdef0123456789 --security-groups sg-0123456789abcdef0

# Create a target group
aws elbv2 create-target-group --name web-targets --protocol HTTP --port 80 --vpc-id vpc-0123456789abcdef0

# Register the EC2 instance with the target group
aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:region:account-id:targetgroup/web-targets/abcdef0123456789 --targets Id=$INSTANCE_ID

# Create a listener
aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/web-lb/abcdef0123456789 --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:region:account-id:targetgroup/web-targets/abcdef0123456789

echo "Load balancer is set up."
```