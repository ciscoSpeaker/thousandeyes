locals {
  agentsMexicoCityFrom = csvdecode(file("${path.module}/agentsMexicoCityFrom.csv"))
  agentsMexicoCityFrom_id_name = {for ag_name in local.agentsMexicoCityFrom : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityFrom_id = keys(local.agentsMexicoCityFrom_id_name)
  agentMexicoCityFrom_name = values(local.agentsMexicoCityFrom_id_name) 
  }

locals {
  agentsMexicoCityIPv6From = csvdecode(file("${path.module}/agentsMexicoCityIPv6From.csv"))
  agentsMexicoCityIPv6From_id_name = {for ag_name in local.agentsMexicoCityIPv6From : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityIPv6From_id = keys(local.agentsMexicoCityIPv6From_id_name)
  agentMexicoCityIPv6From_name = values(local.agentsMexicoCityIPv6From_id_name) 
  }

locals {
  agentsMexicoCityTo = csvdecode(file("${path.module}/agentsMexicoCityTo.csv"))
  agentsMexicoCityTo_id_name = {for ag_name in local.agentsMexicoCityTo : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityTo_id = keys(local.agentsMexicoCityTo_id_name)
  agentMexicoCityTo_name = values(local.agentsMexicoCityTo_id_name) 
  }

locals {
  agentsMexicoCityIPv6To = csvdecode(file("${path.module}/agentsMexicoCityIPv6To.csv"))
  agentsMexicoCityIPv6To_id_name = {for ag_name in local.agentsMexicoCityIPv6To : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityIPv6To_id = keys(local.agentsMexicoCityIPv6To_id_name)
  agentMexicoCityIPv6To_name = values(local.agentsMexicoCityIPv6To_id_name) 
  }

output "agents_MexicoCity" {
  value = local.agentsMexicoCityTo_id_name
}

output "agents_MexicoCity_IPv6" {
  value = local.agentsMexicoCityIPv6To_id_name
}