module "naming" {
  source       = "./modules/naming-convention"
  location     = var.location_short
  project      = "lz"
  environment  = "prd"
  applications = ["idt", "tmocker_new"]
}