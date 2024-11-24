resource "aws_ecr_repository" "my_repo" {
  name = "valoriz-repo"
}

resource "null_resource" "build_and_push_image" {
  depends_on = [aws_ecr_repository.my_repo]

  provisioner "local-exec" {
    command = <<EOT
      podman build -t my-container-image .
      aws ecr get-login-password --region us-east-1 | podman login --username AWS --password-stdin ${aws_ecr_repository.my_repo.repository_url}
      podman tag my-container-image:latest ${aws_ecr_repository.my_repo.repository_url}:latest
      podman push ${aws_ecr_repository.my_repo.repository_url}:latest
    EOT
  }
}