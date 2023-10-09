# VARIABLES Y OUTPUTS EN TERRAFORM


## ¿Qué son las Variables en Terraform?
Elementos que definen valores bajo un nombre que puede ser reutilizado en todo el còdigo, disminuye el trabajo por cambios manuales.


### Tipos de variables
**Variables LOCAL**
Variables que se usan solo dentro del archivo de configuración en el que se declara.

**Variables INPUT**
Variables que pueden ser reusadas a lo largo de todo el còdigo, archivos de configuración y módulos(globales).

DIFERENCIA: Puedes usar variables locales para calcular valores basados en otras variables.

### Tipo de argumento de las variables
Los tipos de variables más comunes incluyen:

- **string:** Para cadenas de texto.
- **number:** Para valores numéricos.
- **list:** Para listas de valores.
- **map:** Para mapeos de claves y valores.
- **bool:** Para valores booleanos (true o false).
- **object:** Para objetos complejos.

### ¿Cómo declaramos una variable?
Lo hacemos a través del bloque `variable`, que puede recibir los parametros:
- default
- type
- description
- sensitive (bool)

Para las variables locales lo hacemos con el bloque `locals`

```hcl
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

Podemos declararlas en ***los archivos de configuración*** o en un archivo de solo variables ***variables.tf***.

### ¿Como seteamos una variable?
1. De forma manual, si no definimos un valor, el CLI nos lo pedirá al hacer un `plan` o `apply`.

2. Mediante el argumento default.
```hcl
    variable "db_name" {
        default = "mydb"
    }  
```
3. Mediante el flag 
 ```shell
   terraform apply -var="db_user=foo" 
```
4. En un archivo **.tfvars**
```hcl
    db_name       = "mydb"
    db_user       = "foo"
```
### ¿Como llamamos a una variable?
```hcl
resource "aws_instance" "instance_1" {
  ami             = var.ami
  instance_type   = var.instance_type
  tags = {
    Name = local.vmname
  }
}
```

### EJEMPLOS
```hcl
variable "environment" {
  description = "Environment (e.g., dev, prod)"
}

locals {
  app_name = "my-app"
  instance_name = "ec2-${local.app_name}-${var.environment}"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = local.instance_name
  }
}
```

## OUTPUTS
Vuelven disponible la información sobre nuestra infraestructura en la consola.

### ¿Como declaramos un output?
Lo hacemos a través del bloque `output`, que puede recibir los parametros:
- value
- description
- sensitive

### EJEMPLO 

```hcl
output "db_password" {
  value       = aws_db_instance.db.password
  description = "The password for logging in to the database."
  sensitive   = true
}
```