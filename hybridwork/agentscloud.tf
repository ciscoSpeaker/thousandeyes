locals {
  cloudagents = jsondecode(file("${path.module}/agentscloud.json")) 
  agents_name_id = {for ag_name in local.cloudagents.agents : ag_name.agentName => ag_name.agentId}
  agentName = keys(local.agents_name_id)
  agentId = values(local.agents_name_id) 
  }

output "cloud_agents" {
  value = local.agents_name_id
}