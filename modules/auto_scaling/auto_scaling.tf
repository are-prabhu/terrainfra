resource "aws_launch_template" "template" {
  name                   = "${var.launch_template_name}"
  image_id               = "${var.image_id}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids }"]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  desired_capacity = 1
  max_size         = 2
  min_size         = 1

  # load_balancers      = ["${var.load_balancers_ids}"]
  health_check_type   = "ELB"
  vpc_zone_identifier = ["${var.vpc_zone_identifier}"]
  target_group_arns   = ["${var.target_group_arns}"]

  launch_template = {
    id      = "${aws_launch_template.template.id}"
    version = "$$Latest"
  }
}
