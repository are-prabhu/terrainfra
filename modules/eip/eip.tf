resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${var.instance_id}"
  allocation_id = "${aws_eip.elastic_ip.id}"
}

resource "aws_eip" "elastic_ip" {
  vpc = true
}
