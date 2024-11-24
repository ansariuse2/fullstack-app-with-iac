resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids         = [var.subnet_ids]     # Reference the single subnet
    security_group_ids = [var.security_group] # Reference the single security group
  }

  depends_on = [aws_iam_role.eks_role]
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_role_arn

  subnet_ids = [var.subnet_ids] # Reference the single subnet

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
}
