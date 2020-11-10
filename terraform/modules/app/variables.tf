variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}

variable subnet_id {
  description = "Subnet"
}

variable db_url {
  description = "Database url"
  default     = "127.0.0.1:21017"
}

variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
  default     = "~/.ssh/ubuntu"
}
