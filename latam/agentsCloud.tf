locals {
  agentsCloudFrom = csvdecode(file("${path.module}/agentsCloudFrom.csv"))
  agentsCloudTo   = csvdecode(file("${path.module}/agentsCloudTo.csv"))

  agentCloudFrom_id = [
    for ag in local.agentsCloudFrom : tonumber(ag.agent_id)
  ]

  agentsCloudTo_map = {
    for ag in local.agentsCloudTo : tostring(ag.agent_id) => {
      agent_id       = tonumber(ag.agent_id)
      agent_name     = ag.agent_name
      agent_country  = ag.agent_country
      agent_location = ag.agent_location
    }
  }
}