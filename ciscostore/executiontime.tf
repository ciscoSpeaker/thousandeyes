locals {
  timenow = timestamp()
  now = formatdate("hh:mm:ss ZZZ - MMM/DD/YYYY", local.timenow)
}

output "execution_time" {
  value = local.timenow
}
