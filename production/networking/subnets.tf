#create public subnets in two different availability zones

module "subnet_public_a" {
  source            = "../../modules/subnet_public"
  environment       = "${var.environment}"
  cidr_block        = "${var.subnet_a_public}"
  vpc_id            = "${module.vpc.vpc_id_out}"
  availability_zone = "${var.subnet_a_az}"
  prefix            = "${var.prefix}"
  aws_region        = "${var.aws_region}"
  route_table_id    = "${module.public_route.pub_route_table_id_out}"
}

module "subnet_public_b" {
  source            = "../../modules/subnet_public"
  environment       = "${var.environment}"
  cidr_block        = "${var.subnet_b_public}"
  vpc_id            = "${module.vpc.vpc_id_out}"
  availability_zone = "${var.subnet_b_az}"
  prefix            = "${var.prefix}"
  aws_region        = "${var.aws_region}"
  route_table_id    = "${module.public_route.pub_route_table_id_out}"
}

#create private subnets in two different availability zones

module "subnet_private_a" {
  source            = "../../modules/subnet_private"
  environment       = "${var.environment}"
  cidr_block        = "${var.subnet_a_private}"
  vpc_id            = "${module.vpc.vpc_id_out}"
  availability_zone = "${var.subnet_a_az}"
  prefix            = "${var.prefix}"
  aws_region        = "${var.aws_region}"
  route_table_id    = "${module.az_a_private_route.priv_route_table_id_out}"
}

module "subnet_private_b" {
  source            = "../../modules/subnet_private"
  environment       = "${var.environment}"
  cidr_block        = "${var.subnet_b_private}"
  vpc_id            = "${module.vpc.vpc_id_out}"
  availability_zone = "${var.subnet_b_az}"
  prefix            = "${var.prefix}"
  aws_region        = "${var.aws_region}"
  route_table_id    = "${module.az_b_private_route.priv_route_table_id_out}"
}
