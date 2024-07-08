locals {
  agentsRPi = jsondecode(file("${path.module}/agentsRPi.json")) 
  agentsRPi_name_id = {for ag_name in local.agentsRPi.agents : ag_name.agentName => ag_name.agentId}
  agentagentsRPiName = keys(local.agentsRPi_name_id)
  agentagentsRPiId = values(local.agentsRPi_name_id) 
  }

output "agents_RPi" {
  value = local.agentsRPi_name_id
}