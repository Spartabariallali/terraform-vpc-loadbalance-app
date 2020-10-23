provider "aws" {
  region = "${var.region}"
}

resource "aws_lb" "alb" {
  name               = "${var.alb-name}"
  internal           = "${var.internal}"
  load_balancer_type = "application"
  security_groups    = ["${var.alb-sg}"]
  subnets            = ["subnet-035e8ab575fee1b0e","subnet-0386ddbcc87915ce1"]

  enable_deletion_protection = "false"


  tags = {
    Name = "${var.alb-tag}"
  }
}

resource "aws_alb_listener" "frontend-listner-80" {
  default_action {
    target_group_arn = "${var.target-group-arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = 80
}

resource "aws_alb_listener" "frontend-listner-443" {
  default_action {
    target_group_arn = "${var.target-group-arn}"
    type = "forward"
  }
  load_balancer_arn = "${aws_lb.alb.arn}"
  port = 443
  protocol = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn = "${var.certificate-arn}"
}
