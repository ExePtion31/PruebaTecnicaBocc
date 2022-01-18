variable "AWS_REGION"{
    default = "us-east-2"
}

variable "ami_id" {
  default = {
    "us-east-2" = "ami-05803413c51f242b7"
  }
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "path_lambda" {
  type = map(string)
  default = {
    unzip = "./files/lambda/index.js"
    zip = "./files/lambda/index.zip"
  }
}

variable "stack_id" {
  type = string
  default = "technical-test-bocc"
}