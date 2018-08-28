output "launch_template_id" {
  value = "${aws_launch_template.template.id}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.autoscaling_group.id}"
}
