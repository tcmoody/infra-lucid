resource "aws_lb" "alb" {
  name               = "lucid-lb"
  internal           = false
  load_balancer_type = "application"
  # circle back on this
#   security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.lb_subnets

  enable_deletion_protection = true
# would be nice to add this if I have time
#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "alb-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}
