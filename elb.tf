resource "aws_elb" "api-farrukhcluster-com" {
  name = "api-farrukhcluster-com-nrprmu"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-farrukhcluster-com.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-farrukhcluster-com.id}", "${aws_subnet.utility-eu-west-1b-farrukhcluster-com.id}", "${aws_subnet.utility-eu-west-1c-farrukhcluster-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "farrukhcluster.com"
    Name              = "api.farrukhcluster.com"
  }
}

resource "aws_elb" "bastion-farrukhcluster-com" {
  name = "bastion-farrukhcluster-co-q18ns0"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-farrukhcluster-com.id}"]
  subnets         = ["${aws_subnet.utility-eu-west-1a-farrukhcluster-com.id}", "${aws_subnet.utility-eu-west-1b-farrukhcluster-com.id}", "${aws_subnet.utility-eu-west-1c-farrukhcluster-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster = "farrukhcluster.com"
    Name              = "bastion.farrukhcluster.com"
  }
}
