provider "aws" {

  access_key = ASIAZG4Y3JXCZYFONAFX

  secret_key = 28jmzQ49+CTompPjcATHxGsFQhqPJeFnIpBgwyOx

  region     = "us-west-2"
  
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
