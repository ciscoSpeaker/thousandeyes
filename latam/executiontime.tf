resource "time_static" "execution_time" {}

output "execution_time" {
  value = time_static.execution_time.rfc3339
}