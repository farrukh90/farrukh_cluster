resource "aws_vpc" "farrukhcluster-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                          = "farrukhcluster.com"
    Name                                       = "farrukhcluster.com"
    "kubernetes.io/cluster/farrukhcluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "farrukhcluster-com" {
  domain_name         = "eu-west-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                          = "farrukhcluster.com"
    Name                                       = "farrukhcluster.com"
    "kubernetes.io/cluster/farrukhcluster.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "farrukhcluster-com" {
  vpc_id          = "${aws_vpc.farrukhcluster-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.farrukhcluster-com.id}"
}