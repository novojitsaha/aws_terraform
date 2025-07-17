## Fault Tolerant AWS Architecture

A highly available and fault tolerant AWS architecture implemented with Terraform.

### Architecture Diagram 
![Fault tolerant AWS Architecture](./diagram/AWS%20Architecture%202.2.drawio.png)


### Multi Availability Zones
Fault tolerance is assured by deploying resources in two different availability zones. If one fails, resources in the other one will guarantee uptime. A load balancer is used to distribute traffic between the two different zones. 

### Auto Scaling EC2s
At times of excessive traffic, Auto Scaling Group spins up new EC2s to handle the extra load. When load decreases, extra EC2s are shut down. 

### Standby replica RDBMS
All the EC2s have read/write access to the Primary DB. Data is replicated synchronously to a secondary DB. When the primary DB fails, the secondary DB takes over, guaranteeing uptime. S


### Security
Both the EC2s and the DBs are placed in Private Subnets to ensure strict security. The EC2s are able to access the internet through the Internet Gateway placed in the public subnets. Only the necessary ports and routes are added to the route tables between the subnets, thus ensuring Least Privilege Principal.   

### Deployment
 1. Ensure Terraform is installed. 
 2. Set up AWS credentials using the AWS CLI command `aws configure`.
 3. Clone the git repo.
 4. Initialize terraform using `terraform init`.
 5. Validate the repo using `terraform validate`. 
 6. Review the execution using `terraform plan`.
 7. Apply with `terraform apply`.