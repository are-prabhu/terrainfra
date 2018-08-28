module "master_key" {
  source     = "../../modules/key_pair"
  key_name   = "${var.master_key_name}"
  public_key = "${var.master_key_ssh_public_key}"
}

module "bastion_key" {
  source     = "../../modules/key_pair"
  key_name   = "${var.bastion_key_name}"
  public_key = "${var.bastion_key_ssh_public_key}"
}
