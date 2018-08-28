resource "aws_lb" "alb" {
  name               = "${var.alb_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${var.security_groups}"]
  subnets            = ["${var.subnet_ids}"]

  tags {
    Environment = "${var.environment}"
    Name        = "${var.alb_name}"
    Region      = "${var.aws_region}"
  }
}

resource "aws_lb_target_group" "target_group_http" {
  name        = "${var.target_group_name}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "${var.target_type}"
}

# resource "aws_lb_target_group_attachment" "target_group_attachment_0" {
#   target_group_arn = "${aws_lb_target_group.target_group_http.arn}"
#   target_id        = "${element(var.instance_ids, 0)}"
#   port             = 80
# }

# resource "aws_lb_target_group_attachment" "target_group_attachment_1" {
#   target_group_arn = "${aws_lb_target_group.target_group_http.arn}"
#   target_id        = "${element(var.instance_ids, 1)}"
#   port             = 80
# }

data "aws_acm_certificate" "certificate" {
  domain   = "${var.domain}"
  statuses = ["ISSUED", "PENDING_VALIDATION"]
}

# alb listener (https)
resource "aws_alb_listener" "alb_https" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${data.aws_acm_certificate.certificate.arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.target_group_http.arn}"
    type             = "forward"
  }
}

# alb listener (http)
resource "aws_alb_listener" "alb_http" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.target_group_http.arn}"
    type             = "forward"
  }
}
