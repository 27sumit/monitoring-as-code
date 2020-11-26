resource "newrelic_infra_alert_condition" "high_cpu_usage" {
  for_each = var.infra_alerts
  policy_id = newrelic_alert_policy.infra[each.key].id

  name       = "TechOps: CPU Usage is too High - For ${each.key}"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "cpuPercent"
  comparison = "above"
  where      =  each.value[0]

  critical {
    duration      = each.value[1]
    value         = each.value[2]
    time_function = "all"
  }

}

resource "newrelic_infra_alert_condition" "high_disk_usage" {
  for_each = var.infra_alerts
  policy_id = newrelic_alert_policy.infra[each.key].id

  name       = "TechOps: Disk Usage is too High - For ${each.key}"
  type       = "infra_metric"
  event      = "StorageSample"
  select     = "diskUsedPercent"
  comparison = "above"
  where      = each.value[0]

  critical {
    duration      = each.value[3]
    value         = each.value[4]
    time_function = "all"
  }

}

resource "newrelic_infra_alert_condition" "high_memory_usage" {
  for_each = var.infra_alerts
  policy_id = newrelic_alert_policy.infra[each.key].id

  name       = "TechOps: Memory Usage is too High - For ${each.key}"
  type       = "infra_metric"
  event      = "SystemSample"
  select     = "memoryUsedBytes/memoryTotalBytes*100"
  comparison = "above"
  where      = each.value[0]

  critical {
    duration      = each.value[5]
    value         = each.value[6]
    time_function = "all"
  }

}

resource "newrelic_infra_alert_condition" "host_not_reporting" {
  for_each = var.infra_alerts
  policy_id = newrelic_alert_policy.infra[each.key].id

  name       = "TechOps: Host not reporting - For ${each.key}"
  type       = "infra_host_not_reporting"
  where      = each.value[0]

  critical {
    duration = each.value[7]
  }
}
