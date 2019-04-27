terraform {
  backend "s3" {
    bucket = "farrukhcluster.com" 
    key = "state/farrukh_cluster"
    region = "eu-west-1"
  }
}


terraform = {
  required_version = ">= 0.9.3"
}
