variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
  default     = "t2.micro"
}
variable "region" {
  description = "The AWS region to deploy the resources in."
  type        = string
  default     = "ap-southeast-1"
}
variable "ami" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = "ami-04173560437081c75"
}
variable "key_name" {
  description = "The name of the key pair to use for SSH access to the EC2 instance."
  type        = string
  default     = "gopal123"
}
