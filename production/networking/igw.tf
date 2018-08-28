#-------------------------------------------------------------------------------
# igw.tf -  internet gatway for vpc
#-------------------------------------------------------------------------------

module "igw" {
  source      = "../../modules/internet_gateway"
  environment = "${var.environment}"
  vpc_id      = "${module.vpc.vpc_id_out}"
  prefix      = "${var.prefix}"
  aws_region  = "${var.aws_region}"
}
