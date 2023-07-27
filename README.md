
# THIS PROJECT SILL NOT WORK 

# eks-stack
## Description
This project aims to deploy a highly available infrastructure on AWS using Terraform. The infrastructure includes a VPC with 4 subnets, an Application Load Balancer (ALB), an Elastic Kubernetes Service (EKS) cluster with a Managed Node Group, and various supporting resources such as route tables, NAT Gateways, and security groups. Additionally, monitoring and scaling functionalities are implemented using Prometheus, Amazon Managed Service for Prometheus (AMP), Grafana, Cluster AutoScaler, and AWS ALB Ingress Controller.

## Environment Setup
To set up the environment, follow these steps:

1. Clone the repository: "git clone <repository_url>"
2. Navigate to the project directory: "cd <project_directory>"
3. Ensure you have the necessary credentials to access AWS.
4. Install Terraform if it's not already installed.
5. Open the terminal and initialize Terraform by running the command: "terraform init"
6. Set up the required variables in the "terraform.tfvars" file, including the region, availability zones (AZs), CIDR block, etc.
7. Run "terraform apply" to create the infrastructure resources.


## Terraform Modules
The project utilizes a modular structure with separate modules for VPC and EKS.
The modules directory contains the following modules:

## VPC Module
* alb.tf: This file defines the resources required for the Application Load Balancer (ALB) in the public subnets.
* eks.tf: This file sets up the Elastic Kubernetes Service (EKS) cluster in the private subnets.
* main.tf: This file combines all the necessary resources to create the VPC.
* outputs.tf: This file defines the outputs of the VPC module.
* provider.tf: This file configures the AWS provider.
* variables.tf: This file defines the input variables for the VPC module.

## EKS Module
The EKS module is responsible for creating the EKS cluster,
 managed node group, and other resources required for the Kubernetes environment.


# Deployment
The deployment directory contains the necessary Kubernetes manifests for deploying the "Hello World" NGINX application and configuring the ingress.
    ├── deploymnet
    │   ├── 00.namespace.yaml
    │   ├── 01.deployment.yaml
    │   ├── 02.nginx-hpa.yaml
    │   ├── 03.ingress.yaml
    │   └── readme.md

namespace.yaml: Creates a Kubernetes namespace for the application.
deployment.yaml: Defines the deployment of the NGINX application. and Nginx service.
ingress.yaml: Configures the ingress rules for the application.


## Monitoring and Alerting
To enable monitoring and alerting, Prometheus is deployed on the EKS cluster and sends metrics to Amazon Managed Service for Prometheus (AMP).
 Additionally, an Amazon Managed Grafana instance is deployed to analyze metrics, logs, and traces.
 A simple dashboard is also created on Amazon Managed Grafana to visualize the collected metrics.


##  Cluster AutoScaler and Load Balancing (Task 3)
Cluster AutoScaler is configured on the EKS cluster to automatically scale the nodes based on the defined minimum, maximum, and desired capacity.
An NGINX application is deployed as a Kubernetes deployment and exposed as a service on TCP port 80.
Horizontal Pod Autoscaler (HPA) resource is set up to scale the application based on CPU utilization. 
Furthermore, the AWS ALB Ingress Controller is deployed to handle the ingress traffic for the NGINX application. 
Access to the "Hello World" NGINX Application can be achieved using the ALB URL. 
The services or nodes will be scaled up when the load increases and scaled down when the load decreases.

## Conclusion
This project provides a comprehensive infrastructure setup for deploying containerized applications on AWS. 
By following the steps outlined in the environment setup section and utilizing Terraform, you can easily create the required resources. 
The project also includes monitoring and scaling functionalities to ensure the availability and efficient management of the deployed applications.
