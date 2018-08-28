output "aws_lb_id" {
  value = "${aws_lb.alb.id}"
}

output "aws_lb_target_group_id" {
  value = "${aws_lb_target_group.target_group_http.id}"
}

# output "aws_lb_target_group_attachment_0_id" {
#   value = "${aws_lb_target_group_attachment.target_group_attachment_0.id}"
# }

# output "aws_lb_target_group_attachment_1_id" {
#   value = "${aws_lb_target_group_attachment.target_group_attachment_1.id}"
# }

output "aws_alb_listener_https_id" {
  value = "${aws_alb_listener.alb_https.id}"
}

output "aws_alb_listener_http_id" {
  value = "${aws_alb_listener.alb_http.id}"
}
