-> Clone the repository
# git clone <repository URL>

-> This are the steps for create aws amplify using terraform

-> create terraform.tfvars file and mention variable value in that. i.e. - project_name = "next-js-demo-app"
(1) access_key
(2) secret_key
(3) region
(4) project_name
(5) github_repository (without .git extension)
(6) github_token_for_webapp

-> Run the following command which is mention below

-> This command will initialize the terraform
# terraform init

-> This command will give us basic overview of which services we are going to creating.
# terraform plan

-> This command will execute the terraform file. It will create infrastructure in aws.
# terraform apply --auto-approve 

-> After applying the terraform it will automatic create inbuilt functionality of CICD for the amplify service. so when we push our code it will automatically deploy on amplify.

-> If we want to destroy our infrastructure then we need to use this command
# terraform destroy --auto-approve

**OR**

-> We can use aws cli also for the aws amplify service. for that we need to run the command in terminal of our code repository. after that  we need to give some details which it will ask for.
# amplify init