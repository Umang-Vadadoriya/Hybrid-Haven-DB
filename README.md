# Hybrid-Haven-DB from Scratch

## AWS Account Setup

To deploy resources on AWS using Terraform, you need an AWS account. If you don't have an AWS account, follow these steps to create one:

1. Sign in to the AWS Management Console
2. Navigate to IAM (Identity and Access Management)
3. Create a New IAM User
4. Enter User Details    
5. Set Permissions
6. Create the User
7. View Access Key ID and Secret Access Key
8. Download Credentials for deploy resources on AWS using Terraform

for reference visit https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html

## Terraform Installation

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Follow these steps to install Terraform on your local machine:

1. Download the appropriate Terraform binary for your operating system from the https://developer.hashicorp.com/terraform/install.
2. Extract the downloaded archive to a directory included in your system's PATH.
3. Verify the installation by running terraform version in your terminal. You should see the Terraform version printed to the console.

For reference visit https://spacelift.io/blog/how-to-install-terraform

## Liquibase Installation

Liquibase is an open-source database-independent library for tracking, managing, and applying database changes. Follow these steps to install Liquibase on your local machine:

1. Download the Liquibase command-line tool from the https://www.liquibase.org/DOWNLOAD.
2. Extract the downloaded archive to a directory included in your system's PATH.
3. Verify the installation by running liquibase --version in your termin al. You should see the Liquibase version printed to the console.

For reference visit https://docs.liquibase.com/start/install/liquibase-windows.html

## Terraform Configuration

1. Create infrastructure for this project ( you can use any name for directory and filename )

    - Create a directory - Terraform
    - Inside that create hybrid-haven.tf file to specify AWS resources like VPC, subnet, security groups, and RDS instance according to your requirements.

2. Navigate to the Terraform directory

3.  Run `terraform init` to initialize the Terraform configuration.

    ![1](https://github.com/Umang-Vadadoriya-BBD/Hybrid-Haven-DB/assets/160098615/e6c546b5-7014-4b54-b657-065c8b03baec)

4. Run `terraform validate` to validates the configuration files in a directory, referring only to the configuration

  ![2](https://github.com/Umang-Vadadoriya-BBD/Hybrid-Haven-DB/assets/160098615/85e5bfb7-ba80-4236-8b36-384cedbf9c5b)

5. Run `terraform plan` to review the planned infrastructure changes.

![4](https://github.com/Umang-Vadadoriya-BBD/Hybrid-Haven-DB/assets/160098615/2c6b8670-b6c8-428f-8b9a-2dc23f4403b5)
 
6. If everything looks correct, run `terraform apply` to deploy the infrastructure on AWS.

```
terraform apply
```
### Diagram

![image](https://github.com/Umang-Vadadoriya-BBD/Hybrid-Haven-DB/assets/160090850/7976218a-6996-498e-9e71-9a980f4b7b1d)

