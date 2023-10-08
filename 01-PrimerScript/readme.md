# Creación de una VM en AWS con Terraform




**Clona este repositorio:**


## Pasos
1. **Crea un archivo de configuración de Terraform:**
Crea un archivo llamado `main.tf` en el directorio raíz del repositorio. Agregaremos el bloque `terraform`, donde configuramos los proveedores. 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs

```hcl
terraform {
  required_providers {
    
    }
  }
```
2. Especificar el proveedor, en este caso AWS, podemos ajustar la version.
```hcl
 aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
```
3. Usamos el bloque `provider` para configurar las credenciales y region.
```hcl
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```

3. Declaramos nuesro primer recurso, usando el bloque `resource`, será una instancia EC2. Para conocer los parámetros y sintaxis: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance 

```hcl
resource "aws_instance" "MiVM" {
  ami = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  tags = {
    Name = "AWS_Linux1"
  }
}
```

## Correr Comandos

Sigue estos pasos para crear y gestionar tu VM en AWS con Terraform.

1. **Clona este repositorio:**

   ```shell
   git clone <URL_del_repositorio>
   cd <nombre_del_directorio>
   ```
2. **Inicializa Terraform:**
Ejecuta el siguiente comando para inicializar Terraform y descargar los plugins necesarios:

   ```shell
   terraform init
   ```

3. **Planificando la infra:**

   ```shell
   terraform plan
   ```
4. **Aplica la configuración**

   ```shell
   terraform plan
   ```
5. **OPCIONAL: Destruye la infraestructura**
   ```shell
   terraform destroy
   ```