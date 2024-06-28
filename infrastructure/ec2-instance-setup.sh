```sh
#!/bin/bash

# Launch an EC2 instance
INSTANCE_ID=$(aws ec2 run-instances --image-id ami-0abcdef1234567890 --count 1 --instance-type t2.micro --key-name your-key-pair --security-groups web-sg --query 'Instances[0].InstanceId' --output text)

# Wait until the instance is running
aws ec2 wait instance-running --instance-ids $INSTANCE_ID

# Get the public DNS of the instance
PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].PublicDnsName' --output text)

# Install Apache on the instance
aws ec2-instance-connect send-ssh-public-key --instance-id $INSTANCE_ID --availability-zone us-east-1a --instance-os-user ec2-user --ssh-public-key file://~/.ssh/your-key-pair.pub
ssh -i ~/.ssh/your-key-pair.pem ec2-user@$PUBLIC_DNS 'sudo yum update -y &amp;&amp; sudo yum install -y httpd &amp;&amp; sudo systemctl start httpd &amp;&amp; sudo systemctl enable httpd'

echo "EC2 instance is set up and running at http://$PUBLIC_DNS"
```