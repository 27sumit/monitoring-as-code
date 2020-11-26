terraform {
  source = "../../..//terraform/alerts/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  channel_names = [
            "TechOps: Email - capmon",
            "TechOps: Slack - capmon"
        ]
  # Alerts - Set Thresholds as [ where_clause , cpu_duration , cpu_threshold , disk_duration , disk_threshold , memory_duration , memory_threshold , host_down_duration ]
  infra_alerts = {
        "capmon"      = [ "(`Subdivision` LIKE 'Monitoring')"  , 3 , 75 , 10 , 95 , 5 , 95 , 5 ]
  }
}
