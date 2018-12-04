provider "aws"{
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_instance" "EC2" {
    ami = "ami-0bea3826f70683b2c"
    instance_type = "t2.micro"
    provisioner "local-exec"{
    command = "echo ${aws_instance.EC2.public_ip} > ip_addess.txt"
    }
}

resource "aws_key_pair" "thiagorc"{
    key_name = "${var.key_name}"
    public_key = "${var.public_key}"

}
resource "aws_eip" "ip"{
    instance = "${aws_instance.EC2.id}"
}

