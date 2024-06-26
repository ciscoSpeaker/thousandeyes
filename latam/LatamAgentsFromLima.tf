locals {
  latamAgentsFromLima = csvdecode(file("${path.module}/LatamAgentsFromLima.csv"))
  latamAgentsFromLima_name_id = {for ag_name in local.latamAgentsFromLima : ag_name.agent_id => ag_name.agent_country}
  latamAgentFromLimaId = keys(local.latamAgentsFromLima_name_id)
  latamAgentFromLimaCountry = values(local.latamAgentsFromLima_name_id) 
  }

output "latam_agents" {
  value = local.latamAgentsFromLima_name_id
}

# 66222,"Lima, Peru","PE","Lima, Peru"
# 266386,"Lima, Peru - IPv6","PE","Lima, Peru"
# 946241,"Lima, Peru (AWS Local Zone)","PE","Lima, Peru"
# 1319574,"Lima, Peru (Claro)","PE","Lima, Peru"
# 1319575,"Lima, Peru - IPv6 (Claro)","PE","Lima, Peru"
