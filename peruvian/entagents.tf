locals {
  entagents = jsondecode(file("${path.module}/entagents.json")) 
  agents_name_id = {for ag_name in local.entagents.agents : ag_name.agentName => ag_name.agentId}
  agentName = keys(local.agents_name_id)
  agentId = values(local.agents_name_id) 
  }

output "enterprise_agents" {
  value = local.agents_name_id
}