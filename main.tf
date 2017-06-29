terraform {
  # This partial configuration will be filled in by Terragrunt during runtime.
  # See the docs for Terraform Backend Partial Configuration for more details:
  # https://www.terraform.io/docs/backends/config.html#partial-configuration
  backend "s3" {}
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count = "${var.instance_count}"

  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(var.subnet_ids, count.index)}"

  tags {
    Name = "scaling_terraform_as_your_team_grows example"
  }
}
