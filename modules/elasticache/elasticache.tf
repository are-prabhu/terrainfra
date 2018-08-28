locals {
  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_elasticache_cluster" "elasticache" {
  cluster_id           = "${var.cluster_id}"
  engine               = "${var.engine}"
  node_type            = "${var.node_type}"
  num_cache_nodes      = "${var.num_cache_nodes}"
  parameter_group_name = "${var.parameter_group_name}"
  port                 = "${var.port}"
  subnet_group_name    = "${var.subnet_group_name}"
  security_group_ids   = ["${var.security_group_ids}"]

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.engine} / ${var.environment} / ${var.aws_region}"
    )
  )}"
}
