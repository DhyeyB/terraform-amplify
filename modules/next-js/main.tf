# create a role for amplify
resource "aws_iam_role" "amplify_role" {
  name               = "amplify_deploy_terraform_role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "amplify.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY


  tags = {
    Project = var.project_name
  }
}

# attach amplify policy with the role
resource "aws_iam_role_policy" "amplify_role_policy" {
  name   = "amplify_iam_role_policy"
  role   = aws_iam_role.amplify_role.id
  policy = file("${path.cwd}/modules/next-js/policy_for_amplify_role.json")
}

resource "aws_amplify_app" "webapp" {
  name         = var.project_name
  repository   = var.github_repository
  access_token = var.github_token_for_webapp

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: .next
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  enable_auto_branch_creation = true
  enable_branch_auto_build    = true
  enable_branch_auto_deletion = true
  platform                    = "WEB_COMPUTE"

  auto_branch_creation_config {
    enable_pull_request_preview = true
    environment_variables = {
      APP_ENVIRONMENT = "develop"
    }
  }

  iam_service_role_arn = aws_iam_role.amplify_role.arn
    
    custom_rule {
    source = "/<^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json)$)([^.]+$)>"
    status = "200"
    target = "/index.html"
    condition = "null"
  }

  tags = {
    Project = var.project_name
  }
}


resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.webapp.id
  branch_name = "master"

  enable_auto_build = true

  framework = "Next.js - SSR"
  stage     = "DEVELOPMENT"

  environment_variables = {
    APP_ENVIRONMENT = "develop"
  }
}

