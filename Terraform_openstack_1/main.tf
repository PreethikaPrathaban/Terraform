/* Following section initialize providers*/
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.41.0"
    }
  }
}

/* Variables declared with default values*/
variable "network1_name" {
  default     = ""
  description = "Network available in openstack"
}
variable "vcpu" {
  default     = ""
  description = "vcpu count for created vm"
}
variable "ram" {
  default     = ""
  description = "ram in terms of MB for created vm"
}
variable "storage" {
  default     = ""
  description = "Storage in terms of GB for created vm"
}
variable "image_name" {
  default     = ""
  description = "image to be used for vm"
}
variable "security_group" {
  default     = ""
  description = "security group used for vm"
}


/* data sources used as per the provider support */
data "openstack_compute_flavor_v2" "flavor" {
  vcpus = var.vcpu
  ram   = var.ram
  disk  = var.storage
}

/* Resource declaration for cretaion of VM with required fileds and inline cloud init data */
resource "openstack_compute_instance_v2" "vm_tf" {
  name            = "vm_tf_test"
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  image_name      = var.image_name
  security_groups = [var.security_group]
  network {
    name = var.network1_name
  }
  user_data = "#cloud-config\nhostname: test\nuser: test\npassword: test\nchpasswd: { expire: False }\nssh_pwauth: True"
}

/*output can be displayed as follows*/
output "interface_ip" {
  value       = openstack_compute_instance_v2.vm_tf.network[0].fixed_ip_v4
  description = "Ip assigned from network1"
}