locals {
  common_tags = {
    Environment = "${var.environment}"
  }
}

// need to add logic for provisioned and general ssd
resource "aws_db_instance" "db_instance" {
  allocated_storage         = "${var.allocated_storage}"
  engine                    = "${var.engine}"
  engine_version            = "${var.engine_version}"
  identifier                = "${var.instance_name}"
  instance_class            = "${var.instance_class}"
  name                      = "${var.dbname}"
  username                  = "${var.dbusername}"
  password                  = "${var.dbpassword}"
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  vpc_security_group_ids    = ["${var.security_group_ids}"]
  multi_az                  = "${var.multi_az}"
  backup_retention_period   = "${var.backup_retention_period }"
  final_snapshot_identifier = "${var.instance_name}"

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.role}-db-instance / ${var.environment} / ${var.aws_region}"
    )
  )}"
}
