terraform {
  required_version = "0.11.7"
}

terragrunt = {
  remote_state {
    backend = "s3"

    config {
      bucket  = "terrastate-keeper"
      key     = "${path_relative_to_include()}/production/terraform-compute.tfstate"
      region  = "us-east-1"
      encrypt = true
    }
  }
}

#------------------------------------------------------
# aws config 
#------------------------------------------------------
aws_region = "us-east-1"

aws_profile = "production"

prefix = "opsmagic"

aws_bucket = "terrastate-keeper"

network_state_file = "/production/terraform-network.tfstate"

environment = "production"

instance_type = "t2.micro"

forbidden_account_ids = "1122334455"

#------------------------------------------------------
# key_pair config 
#------------------------------------------------------

master_key_name = "production-master"

bastion_key_name = "bastion-master"

master_key_ssh_public_key = "ssh-rsa CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"

bastion_key_ssh_public_key = "ssh-rsa XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

#------------------------------------------------------
# bastion server config 
#------------------------------------------------------

security_groupname = "bastion-server"

role = "bastion-server"

ec2_security_groupname = "ec2-instance"

bastion_root_size = 30

