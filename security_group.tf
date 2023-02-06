# module "security_group" {
#   source      = "terraform-aws-modules/security-group/aws"
#   name        = "example-security-group"
#   description = "Allow all inbound traffic for demonstration purposes"
#   vpc_id      = module.vpc.vpc_id
# 
# 
#   ingress_rules = [
#     {
#       from_port   = 0
#       to_port     = 65535
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       from_port   = 0
#       to_port     = 65535
#       protocol    = "udp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }


resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Allow all inbound traffic for demonstration purposes"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}