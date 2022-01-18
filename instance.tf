resource "aws_instance" "jenkins_instance" {
   ami           = "${lookup(var.ami_id, local.aws_region)}"
   instance_type = var.instance_type
}