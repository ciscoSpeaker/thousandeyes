locals {
  tag_assignment_rows = csvdecode(file("${path.module}/tag_assignments.csv"))

  enabled_tag_assignment_rows = [
    for row in local.tag_assignment_rows : row
    if lower(trimspace(row.enabled)) == "true"
  ]

  unique_tags_grouped = {
    for row in local.enabled_tag_assignment_rows :
    "${row.tag_object_type}/${row.assignment_key}/${row.assignment_value}" => row...
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

  # Existing tags already present in ThousandEyes.
  # Keep only the ones you want Terraform to adopt/manage.
  existing_tag_ids = {
    "test/service/vpn"                    = "1d77720b-d8ad-49cc-a87b-50206eaf701c"
    "endpoint-test/service/collaboration" = "57d0f77c-1752-4164-96c1-742e461356a7"
    "test/service/ciscotools"             = "5bfefb8f-8d4e-41a8-946a-e52e720cc35e"
    "test/service/collaboration"          = "c46f7ba9-f32c-4ab3-9b87-dc6c06115a99"
  }

  # Only import existing tags that are actually requested by the CSV.
  importable_existing_tags = {
    for k, v in local.existing_tag_ids : k => v
    if contains(keys(local.unique_tags), k)
  }
}