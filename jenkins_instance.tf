#resource "aws_instance" "jenkins" {
#  ami           = "ami-08e637cea2f053dfa"
#  instance_type = "t2.micro"
#
#  provisioner "remote-exec" {
#    inline = [
#      "sudo yum update -y",
#      "sudo yum install -y java-1.8.0-openjdk-devel",
#      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
#      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
#      "sudo yum install -y jenkins",
#      "sudo service jenkins start",
#    ]
#  }
#}
#
#module "ec2_instance" {
#  source = "value"
#}

# To launch an EC2 instance using Terraform and communicate with an EKS cluster, you can follow these steps:

############################This step is not required as we are using custom jenkins image#################################################

#locals {
#  name   = "example-ec2-complete"
#  region = "eu-west-1"
#
#  user_data = <<-EOT
#  #!/bin/bash
#  echo "Hello Terraform!"
#  sudo yum update -y
#  sudo yum install -y java-1.8.0-openjdk-devel
#  sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#  sudo yum install -y jenkins
#  sudo service jenkins start
#  EOT
#
#  tags = {
#    Owner       = "user"
#    Environment = "dev"
#  }
#}


module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                        = "example-ec2-instance"
  ami                         = "ami-025ff5abffdd579a0" # Personal jenkins image built
  instance_type               = "t2.medium" # Minuimum requirement

 ### We might require this later ############ to run scripts while lauching 
  # user_data_base64            = base64encode(local.user_data)
  # user_data_replace_on_change = true
  # tags = {
  #   Terraform   = "true"
  #   Environment = "dev"
  # }
  associate_public_ip_address = true
  key_name                    = "devop-e2e"
  iam_instance_profile        = aws_iam_instance_profile.test_profile.id
  

}

