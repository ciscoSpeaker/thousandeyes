locals {
  agentsSantiago = csvdecode(file("${path.module}/agentsSantiago.csv"))
  agentsSantiago_id_name = {for ag_name in local.agentsSantiago : ag_name.agent_id => ag_name.agent_name}
  agentSantiago_id = keys(local.agentsSantiago_id_name)
  agentSantiago_name = values(local.agentsSantiago_id_name) 
  }

output "agents_Santiago" {
  value = local.agentsSantiago_id_name
}

# delete IPv6
# 281001,"Santiago, Chile - IPv6","CL","Santiago Metropolitan, Chile"
