cuenta           = "betek"
proyecto         = "despliegue-ec2-betek-yennyfer"
key_name         = "nombrekeypair-yennyfer"
private_key_path = "./nombrekeypair.pem"
vpc_id = "vpc-00f479057476a2db8"

tags = {
  "enviroment"    = "dev"
  "desarrollador" = "betek"
  "centro-costos" = "203040"
}




ec2_config = {
  instance_1 = {
    role_name     = "nombredelrolacrearyennyfer"
    ami           = "ami-098e39bafa7e7303d"
    instance_type = "t3.micro"
    subnet_id     = "subnet-00227b47a5f26ec04"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    policy_arn1   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    tagsec2 = {
      Name     = "tags"
      "a-tag1" = "tags"
    }




    root_block_device = {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
    }


  }
}


sg_config = {
  instance_1 = {
    name                 = "ause-sg-cuenta-proyecto"
    description          = "Descripcion para grupo de seguridad"
    vpc_id               = "vpc-00f479057476a2db8"
    projectsecuritygroup = "sgproyect"
    ingress_rules = [
      { from_port = 3389, to_port = 3389, protocol = "tcp", cidr_blocks = ["10.0.0.0/8"] },
      { from_port = 0, to_port = 65535, protocol = "tcp", cidr_blocks = ["10.215.3.51/32"] }
    ]
  }
}
 