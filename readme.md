# Project Name AWS Amplify Setup Guide

This guide outlines the steps to set up AWS Amplify using Terraform or AWS CLI for your project.

## Clone the Repository
To get started, clone the repository to your local machine using the following command: <br>
`git clone <repository URL>`


## Setting Up AWS Amplify with Terraform

1. Create a `terraform.tfvars` file and specify the variable values as shown below: <br>
access_key = "your_access_key" <br>
secret_key = "your_secret_key" <br>
region = "your_aws_region" <br>
project_name = "next-js-demo-app" <br>
github_repository = "your_github_repository of next.js application" # Without .git extension <br>
github_token_for_webapp = "your_github_token" 

2. Initialize Terraform in your project directory: <br>
`terraform init`

3. Get an overview of the services that will be created: <br>
`terraform plan`

4. Apply the Terraform configuration to create the infrastructure on AWS: <br>
`terraform apply --auto-approve`

5. Once Terraform applies the changes, the Amplify service's built-in CICD functionality will be set up. Any code pushed to your repository will automatically deploy on Amplify.

6. To destroy the infrastructure when needed: <br>
`terraform destroy --auto-approve`

## Setting Up AWS Amplify with AWS CLI

1. Navigate to the root directory of your code repository in your terminal.

2. Run the following command to initiate the AWS Amplify setup: <br>
`amplify init`

Follow the prompts and provide the required details as requested.

---

**Note:** Choose either the Terraform-based setup or the AWS CLI setup method, based on your preference and familiarity with the tools. Both methods achieve the same result of setting up AWS Amplify for your project.
