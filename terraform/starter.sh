terraform init

# Format the tf files
terraform fmt 

# Run the 'plan' command and initialize the variable
terraform plan -var-file="terraform.tfvars"

# Run the 'apply' command with yes approval
terraform apply -var-file="terraform.tfvars" -auto-approve
