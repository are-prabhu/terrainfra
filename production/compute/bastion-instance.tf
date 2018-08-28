#-------------------------------------------------------------------------------
# instance.tf -  create basic instance
#-------------------------------------------------------------------------------

locals {
  bastion_ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = "0.0.0.0/0"
  }

  ec2_ingress = {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    security_group_id = "${module.bastion_server_security_group.security_group_id}"
  }
}

module "bastion_server_security_group" {
  source             = "../../modules/security_group"
  environment        = "${var.environment}"
  vpc_id             = "${data.terraform_remote_state.network_state.vpc_id_out}"
  aws_region         = "${var.aws_region}"
  security_groupname = "${var.security_groupname}"
  ingress            = "${local.bastion_ingress}"
  egress             = "${local.egress}"
}

module "bastion_server_instance" {
  source        = "../../modules/aws_instance"
  environment   = "${var.environment}"
  aws_ami_id    = "${data.terraform_remote_state.network_state.ubuntu_16_lts_id}"
  subnet_id     = "${data.terraform_remote_state.network_state.subnet_public_a_id_out}"
  instance_type = "${var.instance_type}"
  aws_region    = "${var.aws_region}"
  key_name      = "${data.terraform_remote_state.network_state.bastion_key_name}"
  volume_size   = "${var.bastion_root_size}"

  vpc_security_group_ids = ["${module.bastion_server_security_group.security_group_id}",
    "${aws_security_group.vpn_inbound_security_group.id}",
  ]

  role = "${var.role}"
}

module "bastion_server_elastic_ip" {
  source      = "../../modules/eip"
  instance_id = "${element(module.bastion_server_instance.aws_instance_id,0)}"
}

module "ec2_security_group" {
  source             = "../../modules/security_group_id"
  environment        = "${var.environment}"
  vpc_id             = "${data.terraform_remote_state.network_state.vpc_id_out}"
  aws_region         = "${var.aws_region}"
  security_groupname = "${var.ec2_security_groupname}"
  ingress            = "${local.ec2_ingress}"
  egress             = "${local.egress}"
}

resource "aws_security_group" "webapp_security_group" {
  name        = "web_app"
  description = "For exposing ports to webapp"
  vpc_id      = "${data.terraform_remote_state.network_state.vpc_id_out}"

  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.vpn_instance_security_group.id}"]
  }
}
