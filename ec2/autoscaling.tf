data "template_file" "init" {
  template = file("./user_data.tpl")
  vars = {
    rds_host = var.rds_host
    rds_username = var.rds_username
    # Not a fan, secrets should be secret
    rds_pw = var.rds_password
  }
}

data "aws_launch_configuration" "user_data" {
  name = "user_data"
  user_data = template_file.init
}

resource "aws_launch_template" "launch_template" {
  name_prefix   = "ec2-launch-template"
  image_id      = var.ami_id
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "ec2_autoscaling" {
  name                      = "lucid-ec2"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  launch_configuration      = aws_launch_configuration.user_data.name
  vpc_zone_identifier       = var.ec2_subnets
  target_group_arns         = [aws_lb_target_group.lucid_target_group.id]
  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

# would be swell to add this if I have time
#   initial_lifecycle_hook {
#     name                 = "foobar"
#     default_result       = "CONTINUE"
#     heartbeat_timeout    = 2000
#     lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

#     notification_metadata = <<EOF
# {
#   "foo": "bar"
# }
# EOF

#     notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
#     role_arn                = "arn:aws:iam::123456789012:role/S3Access"
#   }

  timeouts {
    delete = "15m"
  }
}