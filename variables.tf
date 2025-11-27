variable "cloud_id" {
  type    = string
  default = "b1g74dvkviihjk9vg3kj" # берется из YandexCloud
}

variable "folder_id" {
  type    = string
  default = "b1ggbg9fv4mlhv0tgng4" # берется из YandexCloud
}

variable "your_public_ip" {
  type        = string
  description = "Мой публичный IP адрес для доступа к Bastion"
  default     = "89.109.44.59/32" # Заменять на реальный IP
}

variable "ssh_public_key_path" {
  type        = string
  description = "Путь к файлу с публичным SSH ключом"
  default     = "~/.ssh/id_ed25519.pub"
}