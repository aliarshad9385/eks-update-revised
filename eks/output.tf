output "CLUSTER_SECURITY_GROUP_ID" {
  value = aws_security_group.eks_cluster.id
}

output "CLUSTER_ENDPOINT" {
  value = aws_eks_cluster.EKS_CLUSTER.endpoint
}

output "CLUSTER_VERSION" {
  value = aws_eks_cluster.EKS_CLUSTER.version
}

output "CLUSTER_ID" {
  value = aws_eks_cluster.EKS_CLUSTER.id
}


