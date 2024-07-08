locals {
  agentsSantiagoFrom = csvdecode(file("${path.module}/agentsSantiagoFrom.csv"))
  agentsSantiagoFrom_id_name = {for ag_name in local.agentsSantiagoFrom : ag_name.agent_id => ag_name.agent_name}
  agentSantiagoFrom_id = keys(local.agentsSantiagoFrom_id_name)
  agentSantiagoFrom_name = values(local.agentsSantiagoFrom_id_name) 
  }

locals {
  agentsSantiagoIPv6From = csvdecode(file("${path.module}/agentsSantiagoIPv6From.csv"))
  agentsSantiagoIPv6From_id_name = {for ag_name in local.agentsSantiagoIPv6From : ag_name.agent_id => ag_name.agent_name}
  agentSantiagoIPv6From_id = keys(local.agentsSantiagoIPv6From_id_name)
  agentSantiagoIPv6From_name = values(local.agentsSantiagoIPv6From_id_name) 
  }

locals {
  agentsSantiagoTo = csvdecode(file("${path.module}/agentsSantiagoTo.csv"))
  agentsSantiagoTo_id_name = {for ag_name in local.agentsSantiagoTo : ag_name.agent_id => ag_name.agent_name}
  agentSantiagoTo_id = keys(local.agentsSantiagoTo_id_name)
  agentSantiagoTo_name = values(local.agentsSantiagoTo_id_name) 
  }

locals {
  agentsSantiagoIPv6To = csvdecode(file("${path.module}/agentsSantiagoIPv6To.csv"))
  agentsSantiagoIPv6To_id_name = {for ag_name in local.agentsSantiagoIPv6To : ag_name.agent_id => ag_name.agent_name}
  agentSantiagoIPv6To_id = keys(local.agentsSantiagoIPv6To_id_name)
  agentSantiagoIPv6To_name = values(local.agentsSantiagoIPv6To_id_name) 
  }

output "agents_Santiago" {
  value = local.agentsSantiagoTo_id_name
}

output "agents_Santiago" {
  value = local.agentsSantiagoIPv6To_id_name
}