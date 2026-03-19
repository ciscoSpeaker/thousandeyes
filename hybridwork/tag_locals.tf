locals {
  tag_assignment_rows = csvdecode(file("${path.module}/tag_assignments.csv"))

  enabled_tag_assignment_rows = [
    for row in local.tag_assignment_rows : row
    if lower(trimspace(row.enabled)) == "true"
  ]

  unique_tags_grouped = {
    for row in local.enabled_tag_assignment_rows :
    "${row.assignment_key}:${row.assignment_value}:${row.tag_object_type}" => row...
  }

  unique_tags = {
    for tag_key, rows in local.unique_tags_grouped :
    tag_key => {
      key         = rows[0].assignment_key
      value       = rows[0].assignment_value
      object_type = rows[0].tag_object_type
    }
  }

  grouped_assignments = {
    for tag_key, tag in local.unique_tags :
    tag_key => [
      for row in local.enabled_tag_assignment_rows : {
        id   = row.target_test_id
        type = row.target_type
        name = row.target_test_name
      }
      if row.assignment_key == tag.key
      && row.assignment_value == tag.value
      && row.tag_object_type == tag.object_type
    ]
  }

  existing_tag_ids = {
    "thousandeyes_service:ciscotools:test"              = "48088fc5-c8f4-42b9-a09e-2c366100aa94"
    "thousandeyes_service:collaboration:endpoint-test" = "d27e30e0-ef94-403a-b715-15bf63e7e778"
    "thousandeyes_service:collaboration:test"          = "145adca8-7ef4-4d98-b463-f9ae51a905f6"
    "thousandeyes_service:vpn:test"                    = "1aaef4d0-49fe-4579-8464-5d6740c7d396"
  }

  tags_to_create = {
    for tag_key, tag in local.unique_tags :
    tag_key => tag
    if !contains(keys(local.existing_tag_ids), tag_key)
  }
}