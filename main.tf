terraform {
  # This partial configuration will be filled in by Terragrunt during runtime.
  # See the docs for Terraform Backend Partial Configuration for more details:
  # https://www.terraform.io/docs/backends/config.html#partial-configuration
  backend "s3" {}
}

provider "aws" {
  region = "${var.aws_region}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket     = "${var.vpc_remote_state_bucket}"
    key        = "${var.vpc_remote_state_key}"
    lock_table = "${var.vpc_remote_state_lock_table}"
    region     = "${var.vpc_remote_state_region}"
  }
}

resource "aws_instance" "web" {
  count = "${var.instance_count}"

  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(data.terraform_remote_state.vpc.subnet_ids, count.index)}"

  tags {
    Name = "scaling_terraform_as_your_team_grows example"
  }
}
