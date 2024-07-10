locals {
  cloudAgents = jsondecode(file("${path.module}/cloudAgents.json")) 
  agents_name_id = {for ag_name in local.cloudAgents.agents : ag_name.agentName => ag_name.agentId}
  }

locals {
  agents = csvdecode(file("${path.module}/cloudAgents.csv"))
  agents_id_name = {for ag_name in local.agents : ag_name.agent_id => ag_name.agent_name}
  agent_id = keys(local.agents_id_name)
  agent_name = values(local.agents_id_name) 
  }

output "agents" {
  value = local.agents_id_name
}
