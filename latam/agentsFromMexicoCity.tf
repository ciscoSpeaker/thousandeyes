locals {
  agentsFromMexicoCity = csvdecode(file("${path.module}/agentsFromMexicoCity.csv"))
  agentsFromMexicoCity_id_name = {for ag_name in local.agentsFromMexicoCity : ag_name.agent_id => ag_name.agent_name}
  agentFromMexicoCity_id = keys(local.agentsFromMexicoCity_id_name)
  agentFromMexicoCity_name = values(local.agentsFromMexicoCity_id_name) 
  }