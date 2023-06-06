module "eks" {
  source          = "./eks"
  CLUSTER_NAME    = var.APP_NAME
  WORKERS_SUBNETS = var.WORKERS_SUBNETS
  INSTANCE_TYPES  = var.INSTANCE_TYPES
  API_SUBNET      = var.API_SUBNET
  VPC_ID          = var.VPC_ID

}

resource "time_sleep" "wait_100s" {
  depends_on      = [module.eks]
  create_duration = "100s"
}