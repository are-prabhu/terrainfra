module "az_a_nat_gateway" {
  source      = "../../modules/nat_gateway"
  subnet_id   = "${module.subnet_public_a.pub_sub_id_out}"
  aws_region  = "${var.aws_region}"
  environment = "${var.environment}"
}

module "az_b_nat_gateway" {
  source      = "../../modules/nat_gateway"
  subnet_id   = "${module.subnet_public_b.pub_sub_id_out}"
  aws_region  = "${var.aws_region}"
  environment = "${var.environment}"
}
