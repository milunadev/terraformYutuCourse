
variable "myinstance_type"{

}

variable "my_region" {
  type = string
  description = "Esta es mi region favorita"
  sensitive = false
}

variable "env" {
  type = string
}

variable "ubuntu_v" {
  type = number
}
