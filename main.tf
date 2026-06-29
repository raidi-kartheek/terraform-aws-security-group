resource "aws_security_group" "main" {
  name        = local.sg_names
  description = "Allow traffic for ${var.sg_name} project ${var.project} in ${var.environment}"
  vpc_id      = var.vpc_id

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge (
    var.common_tags,
    var.sg_tags,
    {
    Name = local.sg_names
    }
  )
} 
