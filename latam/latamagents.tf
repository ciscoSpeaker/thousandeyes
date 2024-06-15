locals {
  latamAgents = csvdecode(file("${path.module}/latamagents.csv"))
  latamAgents_name_id = {for ag_name in local.latamAgents : ag_name.agent_id => ag_name.agent_country}
  latamAgentId = keys(local.latamAgents_name_id)
  latamAgentCountry = values(local.latamAgents_name_id) 
  }

output "latam_agents" {
  value = local.latamAgents_name_id
}