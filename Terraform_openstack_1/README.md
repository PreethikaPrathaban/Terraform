# Terraform_openstack_example1
Terraform code to create a virtual machine in openstack environment.

## File content
* [main.tf](/Terraform_openstack_1/main.tf) - contains terraform code for provisioning vm in openstack using terraform-provider-openstack
* [terraform.tfvars](/Terraform_openstack_1/terraform.tfvars) - contains value for variable defined in [main.tf](/Terraform_openstack_1/main.tf)

### Usage 
1. After cloning Terraform_openstack_exmaple1, edit the terraform.tfvars with values respective to 
your openstack environment.
2. Before moving to terraform phases, ensure to source the openrc file downloaded from your openstack.This ensures the credentials of openstack are set as environment variables. So terraform will be able to pick them up.
3. Next, terraform init plan apply phases.
```bash
terraform init
```
Will initialize terraform providers, modules, backends.
```bash
terraform plan
```
Will auto load the opentach credentials that was sourced earlier and variables provided in .tfvars and display a detailed plan which captures the resource that will be created in openstack environment.
```bash
terraform apply
```
 Will display the plan and will wait for a user prompt,verify the output plan and type in "yes" for approval.

That's it!!! Virtual machine will be provisioned in openstack And the state of the resource will
be captured in a terraform state file(terraform.tfstate).


Note: Code tested against Terraform v0.15.3
    
