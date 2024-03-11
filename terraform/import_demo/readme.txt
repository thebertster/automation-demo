Run terraform init
Obtain the UUID of an existing Virtual Service
Run terraform plan -var vs_uuid=virtualservice-xxxxxxxxxxxxxxx -generate-config-out=generated_resources.tf

Terraform should create a file generated_resources.tf importing the specified Virtual Service resource
