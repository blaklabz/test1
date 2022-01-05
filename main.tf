provider "aws" {
  region = "us-east-1"
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "cloud-blak2"
  monitoring             = true
  vpc_security_group_ids = ["sg-08e3d7a49bf79c04c"]
  subnet_id              = "subnet-00b9a43a481212d4a"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
