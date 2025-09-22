terraform {
  required_providers { aws = { source = "hashicorp/aws", version = "~> 5.0" } }
}

resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration { scan_on_push = var.scan_on_push }
  tags = { Name = var.name }
}

# optional lifecycle: keep last 10 images
resource "aws_ecr_lifecycle_policy" "keep_10" {
  repository = aws_ecr_repository.this.name
  policy     = jsonencode({
    rules = [{
      rulePriority = 1,
      description  = "Keep last 10 images",
      selection    = { tagStatus = "any", countType = "imageCountMoreThan", countNumber = 10 },
      action       = { type = "expire" }
    }]
  })
}
