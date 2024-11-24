variable "subnet_ids" {
  description = "The ID of the subnet to use for the EKS cluster"
  type = string
}

variable "security_group" {
  description = "The ID of the security group to use for the EKS cluster"
  type = string
}
variable "cluster_name" {
  type = string
  
}
variable "node_role_arn" {
  description = "The ARN of the IAM role for the node group"
}

variable "desired_size" {
  description = "Desired size of the node group"
  default     = 2
}

variable "max_size" {
  description = "Maximum size of the node group"
  default     = 3
}

variable "min_size" {
  description = "Minimum size of the node group"
  default     = 1
}