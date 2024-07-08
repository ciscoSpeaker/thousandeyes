locals {
  agentsMexicoCityTo = csvdecode(file("${path.module}/agentsMexicoCityTo.csv"))
  agentsMexicoCityTo_id_name = {for ag_name in local.agentsMexicoCityTo : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityTo_id = keys(local.agentsMexicoCityTo_id_name)
  agentMexicoCityTo_name = values(local.agentsMexicoCityTo_id_name) 
  }

output "agents_MexicoCity" {
  value = local.agentsMexicoCityTo_id_name
}

locals {
  agentsMexicoCityFrom = csvdecode(file("${path.module}/agentsMexicoCityFrom.csv"))
  agentsMexicoCityFrom_id_name = {for ag_name in local.agentsMexicoCityFrom : ag_name.agent_id => ag_name.agent_name}
  agentMexicoCityFrom_id = keys(local.agentsMexicoCityFrom_id_name)
  agentMexicoCityFrom_name = values(local.agentsMexicoCityFrom_id_name) 
  }



# deleteIPv6
# 31865,"Guadalajara, Mexico - IPv6","MX","Jalisco, Mexico"
# 1274067,"Cancun, Mexico - IPv6 (Telmex)","MX","Quintana Roo, Mexico"
# 1298789,"Queretaro, Mexico - IPv6 (Telmex)","MX","Querétaro, Mexico"
# 1279774,"Querétaro, Mexico - IPv6 (Axtel)","MX","Querétaro, Mexico"
# 1298791,"Monterrey, Mexico - IPv6","MX","Nuevo León, Mexico"
# 31793,"Bogotá, Colombia - IPv6","CO","Bogota D.C., Colombia"
# 1274070,"Quito, Ecuador - IPv6 (Claro)","EC","Pichincha, Ecuador"
# 1277819,"Medellin, Colombia - IPv6 (Claro)","CO","Antioquia, Colombia"
# 1301594,"Monterrey, Mexico - IPv6 (Telmex)","MX","Nuevo León, Mexico"
# 337686,"Paraíba, Brazil - IPv6","BR","Paraiba, Brazil"
# 1027921,"São Paulo, Brazil - IPv6 (Embratel)","BR","São Paulo, Brazil"
# 1234651,"Brasilia, Brazil - IPv6","BR","Federal District, Brazil"
# 1262326,"Brasilia, Brazil - IPv6 (Claro)","BR","Federal District, Brazil"
# 337676,"Rio de Janeiro, Brazil - IPv6","BR","Rio de Janeiro, Brazil"
# 1277792,"Manaus, Brazil - IPv6 (Claro)","BR","Amazonas, Brazil"
# 1279776,"Salvador, Brazil - IPv6 (TIM)","BR","Estado de Bahia, Brazil"
# 1271984,"Fortaleza, Brazil - IPv6 (Claro)","BR","Ceará, Brazil"
# 1277794,"Belo Horizonte, Brazil - IPv6 (TIM)","BR","Minas Gerais, Brazil"
# 1285499,"Manaus, Brazil - IPv6 (TIM)","BR","Amazonas, Brazil"
# 1274072,"Porto Alegre, Brazil - IPv6 (Claro)","BR","Rio Grande do Sul, Brazil"
# 1302654,"São Paulo, Brazil - IPv6 (Telefônica Brasil)","BR","São Paulo, Brazil"
# 281001,"Santiago, Chile - IPv6","CL","Santiago Metropolitan, Chile"
# 1298658,"Salvador, Brazil - IPv6 (Claro)","BR","Estado de Bahia, Brazil"
# 1319573,"Porto Alegre, Brazil - IPv6 (Vivo)","BR","Rio Grande do Sul, Brazil"
# 148830,"Buenos Aires, Argentina - IPv6","AR","Buenos Aires F.D., Argentina"
# 645566,"Cordoba, Argentina - IPv6","AR","Cordoba, Argentina"
# 95697,"Montevideo, Uruguay - IPv6","UY","Uruguay"
# 1270317,"Buenos Aires, Argentina - IPv6 (Claro)","AR","Buenos Aires F.D., Argentina"
# 412,"São Paulo, Brazil - IPv6","BR","São Paulo, Brazil"


# deleteIPv6
# 1302650,"Mexico City, Mexico - IPv6 (TelMex)","MX","Mexico City, Mexico"
# 838841,"Mexico City, Mexico - IPv6","MX","Mexico City, Mexico"
