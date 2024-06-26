locals {
  latamAgentsLima = csvdecode(file("${path.module}/LatamAgentsLima.csv"))
  latamAgentsLima_name_id = {for ag_name in local.latamAgentsLima : ag_name.agent_id => ag_name.agent_country}
  latamAgentLimaId = keys(local.latamAgentsLima_name_id)
  latamAgentLimaCountry = values(local.latamAgentsLima_name_id) 
  }

output "latam_agents" {
  value = local.latamAgentsLima_name_id
}

