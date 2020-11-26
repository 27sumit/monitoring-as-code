# notification channels
variable channel_names {
  type = set(string)
}

# env suffix
variable env_suffix {
  type = string
  default = ""
}

# alerts
variable "infra_alerts" {
  type = map
  default = {}
}
