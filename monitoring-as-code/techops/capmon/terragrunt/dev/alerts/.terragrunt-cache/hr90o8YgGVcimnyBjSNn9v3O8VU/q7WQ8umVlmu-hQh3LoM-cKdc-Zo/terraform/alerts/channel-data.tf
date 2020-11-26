data "newrelic_alert_channel" "channel" {
  for_each = var.channel_names
  name = each.key
}
