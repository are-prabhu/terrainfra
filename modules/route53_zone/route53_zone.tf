resource "aws_route53_zone" "route53_zone" {
  name    = "${var.hostedzone_name}"
  comment = "For private instances"
  vpc_id  = "${var.vpc_id}"

  tags = {
    Environment = "${var.environment}"
    region      = "${var.aws_region}"
  }
}
