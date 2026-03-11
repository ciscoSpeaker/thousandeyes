import {
  for_each = local.importable_existing_tags

  to = thousandeyes_tag.csv_tags[each.key]
  id = each.value
}