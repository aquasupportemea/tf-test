provider "aws" {
  region     = "us-east-1"
  access_key = "ASIAZG4Y3JXCZYFONAF7"
  secret_key = "28jmzQ49+CTompPjcATHxGsFQhqPJeFnIpBgwyOr"
}


resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible = true
}
