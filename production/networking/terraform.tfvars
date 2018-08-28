terraform {
  required_version = "0.11.7"
}

terragrunt = {
  remote_state {
    backend = "s3"

    config {
      bucket     = "terrastate-keeper"
      key        = "${path_relative_to_include()}/production/terraform-network.tfstate"
      region     = "us-east-1"
      encrypt    = true
      lock_table = "terrastate-keeper"
    }
  }
}

#------------------------------------------------------
# aws config 
#------------------------------------------------------
aws_region = "us-east-1"

aws_profile = "production"

prefix = "opsmagic"

environment = "production"

vpc_cidr_block = "10.16.0.0/16"

#AWS account ID to avoid the accidental provisioning 
forbidden_account_ids = "1234556678899"

#------------------------------------------------------
# cidr blocks 
#------------------------------------------------------
subnet_a_public = "10.16.0.0/24"

subnet_b_public = "10.16.1.0/24"

subnet_a_private = "10.16.32.0/24"

subnet_b_private = "10.16.33.0/24"

bastion = "10.16.192.0/24"

#------------------------------------------------------
master_key_name = "production-master"

bastion_key_name = "bastion-master"

master_key_ssh_public_key = "ssh-rsa CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"

bastion_key_ssh_public_key = "ssh-rsa XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
