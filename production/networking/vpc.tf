#-------------------------------------------------------------------------------
# vpc.tf -  create vpc 
#-------------------------------------------------------------------------------

module "vpc" {
  source         = "../../modules/vpc"
  environment    = "${var.environment}"
  cidr_block     = "${var.vpc_cidr_block}"
  prefix         = "${var.prefix}"
  aws_region     = "${var.aws_region}"
  vpc_cidr_block = "${var.vpc_cidr_block}"
}
