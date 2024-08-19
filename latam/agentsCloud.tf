locals {
  agentsCloudFrom = csvdecode(file("${path.module}/agentsCloudFrom.csv"))
  agentsCloudFrom_id_name = {for ag_name in local.agentsCloudFrom : ag_name.agent_id => ag_name.agent_name}
  agentCloudFrom_id = keys(local.agentsCloudFrom_id_name)
  agentCloudFrom_name = values(local.agentsCloudFrom_id_name) 
  }

locals {
  agentsCloudTo = csvdecode(file("${path.module}/agentsCloudTo.csv"))
  agentsCloudTo_id_name = {for ag_name in local.agentsCloudTo : ag_name.agent_id => ag_name.agent_name}
  agentCloudTo_id = keys(local.agentsCloudTo_id_name)
  agentCloudTo_name = values(local.agentsCloudTo_id_name) 
  }

output "agents_Cloud" {
  value = local.agentsCloudTo_id_name
}