variable "APP_NAME" {
  type        = string
  description = "Name for the eks cluster."
  default     = "test-cluster"
}

variable "CLUSTER_VERSION" {
  default     = "latest_version"
  type        = string
  description = "Kubernetes version in EKS."
}

variable "INSTANCE_TYPES" {
  type    = list(string)
  default = ["t2.medium"]
}

variable "VPC_ID" {
  type        = string
  description = "VPC ID of the vpc where the cluster will be."
  default     = "vpc-36f4fd53"
}

variable "API_SUBNET" {
  type        = list(string)
  description = "List of the subnets for the EKS api server."
  default     = ["subnet-76a41c7a", "subnet-a0b2d68b"]
}

variable "WORKERS_SUBNETS" {
  type        = list(string)
  description = "List of the subnets for the EKS api server."
  default     = ["subnet-76a41c7a", "subnet-a0b2d68b"]
}

variable "API_PRIVATE_ACCESS" {
  type    = bool
  default = false
}

variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

