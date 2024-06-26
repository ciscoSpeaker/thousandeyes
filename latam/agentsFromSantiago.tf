locals {
  agentsFromSantiago = csvdecode(file("${path.module}/agentsFromSantiago.csv"))
  agentsFromSantiago_id_name = {for ag_name in local.agentsFromSantiago : ag_name.agent_id => ag_name.agent_name}
  agentFromSantiago_id = keys(local.agentsFromSantiago_id_name)
  agentFromSantiago_name = values(local.agentsFromSantiago_id_name) 
  }