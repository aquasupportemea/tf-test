provider "aws" {
  region     = "us-east-1"
  access_key = "ASIAZG4Y3JXCZYFONAF7"
  secret_key = "28jmzQ49+CTompPjcATHxGsFQhqPJeFnIpBgwyOr"
  session_token = "IQoJb3JpZ2luX2VjEMH//////////wEaCXVzLWVhc3QtMSJGMEQCIBntoAyLnKkDgHV4P3rBLlHdVl3H0KPiU5C1a3NDvJTjAiAXjMeWdDHheenlaLBwZ4uccpRfCyfTgyly2HsrwID5DiqTAwhKEAEaDDYzMzI5MTM2MTczMyIMwFvfxSncydqLAQHGKvACpL39UxJXVumFJut73wW2IIUWMtwj8Hl2yyn2LH6L3hj7cCXWk8jwYL+OmOwcNSHL7DfrmlmkBDFmdZP+YZ8R4QWQUKZTx0/axhmmSURTh4kJaViGyk9n6g+jFkcxtNDfAhsiepfg6GRRE1AFDnvCLRr+Xn4alMOf6JnZErvYhalnrQ1DVLDDa3H5VZgoZqMc8mSpVvLNPKwUPnjeuT8OYPVelC4KV66Sz8pl8iKq7bCwmwscSK62p7Y1YnOmO899NW3n9ebwQ9vdnJAxrqXecelZee/xM9BlF6ByZFRdYQxNTTT8c9Zu6/6SkmYRt3Qr9xX6baEtWTsOYBDC/PqNvC2fgJXnh4OONedLKecCKoNZbss6rVQaR41kd9xZpAw6Pl1bEtD+XtpnIIBFyeu/89hGbmwTdN9zuLjbvbSQ1KQHcWDiPkXIpYQPrKQIYt9WGV7tdZ73huwQjk2AVqhOMEQTAsaeLxbjoOm6T9VA1vAwp9+zuQY6pwHMWl099gmG5mjSdcQF32lm/+vZB5u06T6ypSnagMjcbJkDj/fRMyBCY6k0zXkyXtG4z3wT6fpG6NMyPIeVBZv+X5Zn2Dk7SCSlHS3g+EE/K/SdnXwyGKHfZuLc2U6XJgt/U+dFBV1JbA6xsxdvKl0Htjy3kWLODdpFJNbMeZJv47bEZnOeCTW5r+ISJM3sjXVC1vAnq/DyF1PJdq/p3BmMoRsAtz9Mgw=="
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
