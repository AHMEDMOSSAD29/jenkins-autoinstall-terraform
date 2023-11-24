resource "aws_instance" "node01" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
  instance_type          = "t2.micro"              # Replace with your desired instance type
  key_name               = aws_key_pair.admin.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  tags = {
    Name = "node01"
  }
  user_data = file("node_01.sh")
}
# resource "aws_instance" "node02" {
#   ami           = "ami-0fc5d935ebf8bc3bc"  # Replace with your desired AMI ID
#   instance_type = "t2.micro"                # Replace with your desired instance type
#   key_name = aws_key_pair.admin.key_name
#   vpc_security_group_ids = [aws_security_group.my_security_group.id]
#   tags = {
#     Name = "node02"
#   }
#   user_data = file("node_02.sh")
# }

resource "aws_instance" "control" {
  ami                    = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
  instance_type          = "t2.micro"              # Replace with your desired instance type
  key_name               = aws_key_pair.admin.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  depends_on             = [aws_instance.node01] # add , aws_instance.node02 if more than one node 
  tags = {
    Name = "control"
  }

  user_data = file("control_01.sh")

  provisioner "remote-exec" {
    inline = [

      "echo '${aws_instance.node01.public_ip} node01' | sudo tee -a /etc/hosts",
      #"echo '${aws_instance.node02.public_ip} node02' | sudo tee -a /etc/hosts",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"      # Replace with the appropriate SSH user for your AMI
      private_key = file("admin") # Replace with the path to your private key file
      host        = self.public_ip
    }
  }

}

resource "aws_key_pair" "admin" {
  key_name   = "admin"
  public_key = file("admin.pub")
}
