resource "aws_security_group" "this" {
  # Iteramos sobre la configuración de grupos de seguridad
  for_each = { for name, config in var.sg_config : name => config }

  # Cambiamos 'name' por 'name_prefix' para evitar conflictos de duplicidad
  name_prefix = "ause1-sg-${var.account}-${each.value.projectsecuritygroup}-"
  vpc_id      = var.vpc_id

  # Reglas de entrada dinámicas
  dynamic "ingress" {
    for_each = lookup(each.value, "ingress_rules", [])
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  # Regla de salida (Permitir todo por defecto)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Etiquetas (Tags)
  tags = merge(
    var.tags,
    {
      # Añadimos el ID de la instancia (each.key) para diferenciar los nombres
      Name = "ause1-sg-${var.account}-${var.project}-${each.key}"
    }
  )

  # Lifecycle recomendado al usar name_prefix
  lifecycle {
    create_before_destroy = true
  }
}