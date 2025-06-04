data "aws_vpc" "default" {
  default = true
}
data "aws_security_group" "default" {
  name = "default"
  vpc_id = data.aws_vpc.default.id
}
resource "aws_instance" "king" {
   count = 2
   ami      = "ami-04173560437081c75"
  instance_type = "t2.micro"
  key_name      = "gopal123"
  vpc_security_group_ids = [data.aws_security_group.default.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    echo "<h1>Hello from $(hostname)</h1>" > /usr/share/nginx/html/index.html
  EOF
    tags = {
        Name = "KingInstance"
}
}
output "aws_instance_public_ips" {
  value = aws_instance.king[*].public_ip
  
}