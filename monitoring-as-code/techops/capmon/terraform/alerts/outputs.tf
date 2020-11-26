locals {
  policy_names = [
    for key, instance in newrelic_alert_policy.infra:
    instance.name
  ]
}

output "policy_names" {
  value = local.policy_names
}
