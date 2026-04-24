variable "sg_config" {
  description = "Configuración de los Segurity Group"
  type = map(object({
    name                 = string
    description          = string
    vpc_id               = string
    projectsecuritygroup = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}

variable "account" {
  description = "cuenta"
  type        = string
}

variable "project" {
  description = "project"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags para recursos de VPC Endpoints"
}

variable "vpc_id" {
  description = "The VPC id to create the security group in"
  type        = string
}
