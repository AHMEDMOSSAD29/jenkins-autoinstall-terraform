output "instance_info" {
  value = {
    node01 = {
      instance_name = aws_instance.node01.tags.Name
      public_ip     = aws_instance.node01.public_ip
    },
    jenkins-ec2-agent = {
      instance_name = aws_instance.jenkins-ec2-agent.tags.Name
      public_ip     = aws_instance.jenkins-ec2-agent.public_ip
    },
    control = {
      instance_name = aws_instance.control.tags.Name
      public_ip     = aws_instance.control.public_ip
    }
  }
}