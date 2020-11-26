resource "newrelic_alert_policy" "infra" {
  for_each = var.infra_alerts
  name = "infra-${each.key}${var.env_suffix}"
  incident_preference = "PER_CONDITION_AND_TARGET"
}

resource "newrelic_alert_policy_channel" "infra" {
  for_each = var.infra_alerts
  policy_id  = newrelic_alert_policy.infra[each.key].id
  channel_ids = local.channel_ids
}

locals {
  channel_ids = [
    for key, instance in data.newrelic_alert_channel.channel:
    instance.id
  ]
}
