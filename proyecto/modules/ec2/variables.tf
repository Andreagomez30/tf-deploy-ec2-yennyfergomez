variable "ec2_config" {
  description = "Configuración de las instancias EC2"
  type = map(object({
    role_name     = string
    ami           = string
    instance_type = string
    subnet_id     = string
    tagsec2       = map(string)
    policy_arn    = string
    root_block_device = object({
      volume_size = number
      volume_type = string
      iops        = number
    })
  }))
}
variable "tags" {
  type        = map(string)
  description = "Tags"
}
variable "security_group_ids" {
  description = "IDs de los grupos de seguridad de las EC2"
  type        = map(string)
}
variable "key_name" {
  description = "Nombre de keypair"
  type        = string
}
variable "private_key_path" {
  description = "Ruta para guardar la llave privada"
  type        = string
}
variable "iam_instance_profiles" {
  description = "Map de los perfiles de instancia IAM"
  type        = map(string)
}