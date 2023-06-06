
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
  # db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  # backup_retention_period = 5 
  
}


# Define the Kubernetes deployment and service for the application
# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name = "scalable-nginx-example"
#     labels = {
#       App = "ScalableNginxExample"
#     }
#   }

#   spec {
#     replicas = 2
#     selector {
#       match_labels = {
#         App = "ScalableNginxExample"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           App = "ScalableNginxExample"
#         }
#       }
#       spec {
#         container {
#           image = "nginx:1.7.8"
#           name  = "example"

#           port {
#             container_port = 80
#           }

#           resources {
#             limits = {
#               cpu    = "0.5"
#               memory = "512Mi"
#             }
#             requests = {
#               cpu    = "250m"
#               memory = "50Mi"
#             }
#           }
#         }
#       }
#     }
#   }
# }
# resource "kubernetes_service" "nginx" {
#   metadata {
#     name = "nginx-example"
#   }
#   spec {
#     selector = {
#       App = kubernetes_deployment.nginx.spec.0.template.0.metadata[0].labels.App
#     }
#     port {
#       port        = 80
#       target_port = 8089
#     }

#     type = "LoadBalancer"
#   }
# }
# resource "kubernetes_deployment" "my_app_deployment" {
#   metadata {
#     name = "my-app"
#   }

#   spec {
#     replicas = 1

#     selector {
#       match_labels = {
#         app = "my-app"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "my-app"
#         }
#       }

#       spec {
#         container {
#           name  = "my-app"
#           image = "swordhealth/node-example"

#           # env {
#           #   name  = "DB_HOST"
#           #   value = aws_db_instance.my_db.endpoint
#           # }

#           # env {
#           #   name  = "DB_PORT"
#           #   value = aws_db_instance.my_db.port
#           # }

#           # env {
#           #   name  = "DB_USER"
#           #   value = aws_db_instance.my_db.username
#           # }

#           # env {
#           #   name  = "DB_PASSWORD"
#           #   value = aws_db_instance.my_db.password
#           # }

#           # env {
#           #   name  = "DB_NAME"
#           #   value = aws_db_instance.my_db.db_name
#           # }
#         }
#       }
#     }
#   }
# }

# Define Kubernetes service for the application
# resource "kubernetes_service" "my_app_service" {
#   metadata {
#     name = "my-app"
#   }

#   spec {
#     selector = {
#       app = "my-app"
#     }

#     port {
#       port        = 8080
#       target_port = 80
#       protocol    = "TCP"
#     }

#     type = "LoadBalancer"
#   }
# }
# # 