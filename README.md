# Terraform AWS EC2 Deployment - Yennyfer Gomez

Este proyecto automatiza el despliegue de infraestructura en AWS utilizando **Terraform**. Se enfoca en la creación de instancias EC2, configuración de Grupos de Seguridad (Security Groups) y roles IAM de manera modular y escalable.

## 🚀 Descripción

El proyecto utiliza una arquitectura modular para gestionar los diferentes componentes de la infraestructura:

- **EC2 Module**: Gestiona la creación de instancias EC2, discos EBS y asociación de perfiles de instancia.
- **Security Group Module**: Configura las reglas de firewall (ingress/egress) necesarias para las instancias.
- **IAM Module**: Crea roles y perfiles de instancia con políticas específicas (SSM, CloudWatch, etc.).

## 📂 Estructura del Proyecto

```text
.
├── .github/workflows/   # CI/CD con GitHub Actions
├── proyecto/
│   ├── modules/         # Módulos reutilizables (ec2, iam, security_group)
│   ├── main.tf          # Orquestación de módulos
│   ├── variables.tf     # Definición de variables de entrada
│   ├── terraform.tfvars # Valores específicos de configuración
│   └── backend.tf       # Configuración del estado remoto (S3)
└── README.md
```

## 🛠️ Requisitos Previos

1.  **Terraform** (v1.0+)
2.  **AWS CLI** configurado con credenciales adecuadas.
3.  Un **Bucket S3** existente para almacenar el archivo de estado (`terraform.tfstate`).

## ⚙️ Configuración

El archivo `terraform.tfvars` es donde se definen los parámetros específicos. Ejemplo de configuración de una instancia:

```hcl
ec2_config = {
  instance_1 = {
    role_name     = "nombredelrolacrearyennyfer"
    ami           = "ami-098e39bafa7e7303d"
    instance_type = "t3.micro"
    subnet_id     = "subnet-xxxxxxx"
    policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    policy_arn1   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    tagsec2 = {
      Name = "ec2-instancia-aprendizaje-yennyferg"
    }
    root_block_device = {
      volume_size = 80
      volume_type = "gp3"
      iops        = 3000
    }
  }
}
```

## 🚀 Despliegue

Sigue estos pasos para desplegar la infraestructura:

1.  **Navegar al directorio del proyecto:**
    ```bash
    cd proyecto
    ```

2.  **Inicializar Terraform:**
    ```bash
    terraform init
    ```

3.  **Verificar el plan de ejecución:**
    ```bash
    terraform plan
    ```

4.  **Aplicar los cambios:**
    ```bash
    terraform apply -auto-approve
    ```

## 🤖 CI/CD con GitHub Actions

El repositorio incluye un workflow automatizado en `.github/workflows/deploy.yml` que realiza las siguientes acciones:

-   **Formateo y Validación**: Se asegura de que el código cumpla con los estándares.
-   **Plan**: Se ejecuta automáticamente en cada Pull Request.
-   **Apply**: Se ejecuta automáticamente al hacer push a la rama `main`.

**Secrets necesarios en GitHub:**
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

---
*Desarrollado por Yennyfer Gomez*
