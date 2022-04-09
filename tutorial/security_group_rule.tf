resource "aws_security_group_rule" "ec2-sg-rule1" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.ec2-sg.id
}

resource "aws_security_group_rule" "ec2-sg-rule2" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.ec2-sg.id
}

resource "aws_security_group_rule" "ec2-sg-rule3" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.ec2-sg.id
}

resource "aws_security_group_rule" "ec2-sg-rule" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    source_security_group_id = aws_security_group.ec2-sg.id
    security_group_id = aws_security_group.rds-sg.id
}