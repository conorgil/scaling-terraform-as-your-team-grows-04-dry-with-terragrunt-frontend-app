variable "ami_id" {
  type        = "string"
  description = "The ID of the AMI to use when creating the EC2 instance(s)."
}

variable "instance_count" {
  type        = "string"
  description = "How many servers to run."
}

variable "instance_type" {
  type        = "string"
  description = "What kind of servers to run (e.g. t2.large)."
}

variable "subnet_ids" {
  type        = "list"
  description = "A list of the subnet IDs in which to create EC2 instances."
}

variable "aws_region" {
  type        = "string"
  description = "The AWS region in which to deploy resources"
  default     = "us-east-1"
}
