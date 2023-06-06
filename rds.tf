
# Create an S3 bucket for read-only access
resource "aws_s3_bucket" "read_bucket" {
  bucket = "k-read-bucket"  # Replace with your desired bucket name
  
}

# Create an S3 bucket for write access
resource "aws_s3_bucket" "write_bucket" {
  bucket = "k-write-bucket"  # Replace with your desired bucket name

}

# Create an SQS queue
resource "aws_sqs_queue" "my_queue" {
  name = "demoqueue"  # Replace with your desired queue name
  
}

# Create an RDS MySQL database
resource "aws_db_instance" "my_db" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  parameter_group_name = "default.mysql5.7"
  identifier       = "my-db"  # Replace with your desired database identifier
  username         = "admin"  # Replace with your desired database username
  password         = "admin12345"  # Replace with your desired database password
  skip_final_snapshot  = true
  # backup_retention_period = 5 
  
}
