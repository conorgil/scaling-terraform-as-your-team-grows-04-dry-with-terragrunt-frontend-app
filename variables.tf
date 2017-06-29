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

variable "aws_region" {
  type        = "string"
  description = "The AWS region in which to deploy resources"
  default     = "us-east-1"
}

variable "vpc_remote_state_bucket" {
  type        = "string"
  description = "The name of the S3 bucket containing the VPC remote state."
}

variable "vpc_remote_state_key" {
  type        = "string"
  description = "The name of the object key for the VPC remote state."
}

variable "vpc_remote_state_lock_table" {
  type        = "string"
  description = "The name of the DynamoDB table to use for locking on the VPC remote state."
}

variable "vpc_remote_state_region" {
  type        = "string"
  description = "The region of the S3 bucket containing the VPC remote state."
}
