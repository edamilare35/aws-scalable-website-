# AWS Scalable website/
 This repository documents the setup of a scalable virtual  sserver and landing page for a commercial client using AWS EC2.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Setup Instruction](#setup-instructions)
    - [Prerequisites](#prerequisites)
    - [Infrastructure Setup](#infrastructure-setup)
    - [Website Deployment](#website-deployment)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

This project demostrates how to host a scalable virtual server and landing page on AWS EC2. It includes setting up the necessary infrastructure, configuring security groups, and deploying a sample landing page.

## Architecture

![Architecture Diagram](docs/architecture-diagram.png)

## Setup Instructions

### Prerequisites

- An AWS account
- AWS CLI installed and configured
- Git installed

### Infrastructure Setup

1. **Clone the Repository**
    ```sh git clone https://github.com/yourusername/aws-scalable-website.git cd aws-scalable-website```

2. **Create Security Group**
    ```sh cd infrastructure ./security-group-setup.sh```

3. **Launch EC2 Instance**
    ```sh ./ec2-instance-setup.sh```

4. **Set Up Load Balancer**
    ```sh ./load-balancer-setup.sh```


### Website Deployment

1. **Upload Website Files to EC2**
    ```sh scp -i your-key-pair.pem -r ../website/* ec2-user@your-ec2-public-dns:/var/www/html/```

## Usage

Once the setup is complete, you can access the landing page via the load balancer's DNS name.

## Contributing

Please read [http://CONTRIBUTING.md](http://CONTRIBUTING.md) for details on the code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```
