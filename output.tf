output "instance_info" {
  value = {
    node01 = {
      instance_name = aws_instance.node01.tags.Name
      public_ip     = aws_instance.node01.public_ip
    },
    # node02 = {
    #   instance_name = aws_instance.node02.tags.Name
    #   public_ip     = aws_instance.node02.public_ip
    # },
    control = {
      instance_name = aws_instance.control.tags.Name
      public_ip     = aws_instance.control.public_ip
    }
  }
}