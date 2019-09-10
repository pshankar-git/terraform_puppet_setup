variable "region" {
   default = "ap-south-1" 
 }
variable "vpc_id" {
    default = "vpc-0e684f66"
}
variable "subnet_id" {
    default = "subnet-94dc91fc"
}

variable "ports" {
    type = "list"
    default = ["22", "8140", 0]
}

variable "ami" {
    type = "map"
    default = {
        "us-east-1" = "ami-07d0cf3af28718ef8"
        "us-east-2" = "ami-05c1fa8df71875112"
        "us-west-1" = "ami-08fd8ae3806f09a08"
        "us-west-2" = "ami-06f2f779464715dc5"
        "ap-south-1" = "ami-009110a2bf8d7dd0a"
    }
}
variable "cidr_block_all_traffic" {
    default = "0.0.0.0/0"
}
variable "key_pair_name" {
    default = "puppet_ec2_key"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "tags"{
    type = "list"
    default = ["Master", "Agent"]
}

output "ec2_public_ip" {
  value = "${aws_instance.PuppetServer.*.public_ip}"
}

output "ec2_private_ip" {
  value = "${aws_instance.PuppetServer.*.private_ip}"
}

output "ec2_public_dns" {
  value = "${aws_instance.PuppetServer.*.public_dns}"
}

output "ec2_private_dns" {
  value = "${aws_instance.PuppetServer.*.private_dns}"
}
