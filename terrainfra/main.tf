provider "aws" {
  region  = var.AWS_REGION
  profile = var.AWS_PROFILE
}

resource "aws_launch_configuration" "notifications_launch_configuration" {
  name_prefix   = "notifications_launch_configuration"
  image_id      = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  security_groups = [aws_security_group.allow-ssh.id]
  #key_name = aws_key_pair.mykeypair.key_name
  #user_data = data.template_cloudinit_config.cloudinit-config.rendered
}

resource "aws_autoscaling_group" "notifications_autoscaling_group" {
  name                      = "notifications_autoscaling_group"
  vpc_zone_identifier       = [
    aws_subnet.main-public-1.id
  ]
  launch_configuration      = aws_launch_configuration.notifications_launch_configuration.name
  min_size                  = 2
  max_size                  = 4
  health_check_grace_period = 120
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance notifications"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.main.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_sqs_queue" "queue" {
  name = "my_queue"
}