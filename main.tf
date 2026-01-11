resource "azurerm_dns_caa_record" "dns_caa_records" {
  for_each = var.dns_caa_records

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  zone_name           = each.value.zone_name
  tags                = each.value.tags

  record {
    flags = each.value.record.flags
    tag   = each.value.record.tag
    value = each.value.record.value
  }
}

