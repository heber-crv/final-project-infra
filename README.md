# How to deploy
You need to set up the variables that are defined in the variables.tf file either with a variables.tfvars file or assigning the values directly in the CLI.
In my case I assingn the values on a variables.tfvars file with the exception of the variable ssh_key, I assign this one directly in the CLI with an environmental variable like this.

```sh
terraform apply -var ssh_key=$SSH_KEY -var-file 'variables.tfvars' -auto-approve
```
