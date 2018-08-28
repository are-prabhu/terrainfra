resource "aws_sqs_queue" "sqs_queue" {
  name                      = "${var.sqs_name}"
  delay_seconds             = "${var.delay_seconds}"
  max_message_size          = "${var.max_message_size}"
  message_retention_seconds = "${var.message_retention_seconds}"
  receive_wait_time_seconds = "${var.receive_wait_time_seconds}"

  tags = "${merge(
    map(
        "Name", "${var.role} / ${var.environment} / ${var.aws_region}"
    ),
    map(
      "Environment","${var.environment}"
    )
  )}"
}
