# Proyecto de Infraestructura AWS con Terraform

Este proyecto despliega una infraestructura básica en AWS utilizando Terraform, organizada en módulos para una mejor gestión. Incluye los siguientes componentes:

* **Redes (VPC, Subredes, etc.)**: Configuración de la red virtual privada (VPC) y subredes para alojar los recursos.
* **Cómputo (EC2 con Autoescalado)**: Instancias EC2 configuradas con un grupo de autoescalado para alta disponibilidad y escalabilidad.
* **Balanceo de Carga (ALB)**: Un balanceador de carga de aplicaciones (ALB) para distribuir el tráfico entre las instancias EC2.
* **Base de Datos (RDS)**: Una instancia de base de datos RDS para almacenar datos.

## Estructura del Proyecto

        terraform-proyecto-infra-web/
            ├── main.tf
            ├── provider.tf
            ├── variables.tf
            ├── outputs.tf
            ├── terraform.tfvars
            ├── monitoring.tf 
            ├── modules/
            │   ├── compute/
            │   │   ├── main.tf
            │   │   ├── variables.tf
            │   │   └── outputs.tf
            │   ├── database/
            │   │   ├── main.tf
            │   │   ├── variables.tf
            │   │   └── outputs.tf
            │   └── network/
            │       ├── main.tf
            │       ├── variables.tf
            │       └── outputs.tf

## Módulos

* **network**: Contiene la configuración de la VPC, subredes, puerta de enlace de internet y tabla de enrutamiento.
* **compute**: Define la configuración de las instancias EC2, incluyendo el grupo de autoescalado, la configuración de lanzamiento y el balanceador de carga.
* **database**: Configura la instancia de base de datos RDS.

## Variables

Las variables para la configuración de la infraestructura se definen en `variables.tf` y sus valores se especifican en `terraform.tfvars`.

## Salidas

Las salidas de los módulos se definen en `outputs.tf` para mostrar información relevante sobre los recursos creados.

## Uso

1.  Asegúrate de tener Terraform instalado y configurado con tus credenciales de AWS.
2.  Navega al directorio del proyecto.
3.  Ejecuta `terraform init` para inicializar el proyecto y descargar los proveedores necesarios.
4.  Ejecuta `terraform plan` para ver los cambios que se aplicarán.
5.  Ejecuta `terraform apply` para crear los recursos en AWS.

## Consideraciones Adicionales

* La configuración de seguridad (grupos de seguridad, roles IAM, etc.) debe ser implementada en un entorno de producción.
* Las políticas de autoescalado pueden ser ajustadas para adaptarse a las necesidades específicas de la aplicación.
* Se pueden configurar verificaciones de estado personalizadas para el balanceador de carga y el grupo de autoescalado.
