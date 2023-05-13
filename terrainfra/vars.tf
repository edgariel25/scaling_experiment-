variable "AWS_REGION" {
  # Ireland
  default = "us-east-1"
}

variable "AWS_PROFILE" {
  # the default is default on aws
  default = "default"
}
variable "AMIS" {
  type    = map(string)
  default = {
    us-east-1 = "ami-007855ac798b5175e"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}