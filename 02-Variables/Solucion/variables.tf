variable "amiUbuntu18" {
  description = "Ami del SO Ubuntu 18"  
}

variable "amiUbuntu20" {
  description = "Ami del SO Ubuntu 20"
}

variable "ubuntu_version" {
  type = number
}
variable "env" {
  description = "Ambiente de prod o test"
}