resource "aws_elasticsearch_domain" "elasticsearch" {
  domain_name           = "${var.domain_name}"
  elasticsearch_version = "${var.elasticsearch_version}"

  cluster_config {
    instance_type  = "${var.instance_type}"
    instance_count = "${var.instance_count}"
  }

  advanced_options {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  ebs_options {
    ebs_enabled = "${var.ebs_enabled}"
    volume_size = "${var.volume_size}"
  }

  vpc_options {
    security_group_ids = ["${var.security_group_ids}"]
    subnet_ids         = ["${var.subnet_ids}"]
  }

  tags {
    Environment = "${var.environment}"
    Name        = "${var.domain_name} / ${var.environment} / ${var.role}"
    Role        = "${var.role}"
  }
}

//Allows  associated security groups with your vpc full access to the domain
resource "aws_elasticsearch_domain_policy" "elasticsearch_domain_policy" {
  domain_name = "${aws_elasticsearch_domain.elasticsearch.domain_name}"

  access_policies = <<POLICIES
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "${aws_elasticsearch_domain.elasticsearch.arn}/*"
        }
    ]
}
POLICIES
}
