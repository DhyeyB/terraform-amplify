module "next-js" {
  source = "./modules/next-js"
  #   environment             = var.environment
  project_name            = var.project_name
  github_repository       = var.github_repository
  github_token_for_webapp = var.github_token_for_webapp
}