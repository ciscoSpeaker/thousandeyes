locals {
  cloudAgents = csvdecode(file("${path.module}/cloudAgents.csv"))
  cloudAgents_id_name = {for ag_name in local.cloudAgents : ag_name.agent_id => ag_name.agent_name}
  cloudAgent_id = keys(local.cloudAgents_id_name)
  cloudAgent_name = values(local.cloudAgents_id_name) 
  }

output "cloudAgents" {
  value = local.cloudAgents_id_name
}

locals {
  enterpriseAgents = csvdecode(file("${path.module}/enterpriseAgents.csv"))
  enterpriseAgents_id_name = {for ag_name in local.enterpriseAgents : ag_name.agent_id => ag_name.agent_name}
  enterpriseAgent_id = keys(local.enterpriseAgents_id_name)
  enterpriseAgent_name = values(local.enterpriseAgents_id_name) 
  }

output "enterpriseAgents" {
  value = local.enterpriseAgents_id_name
}
