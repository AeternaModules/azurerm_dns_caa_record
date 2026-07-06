output "dns_caa_records" {
  description = "All dns_caa_record resources"
  value       = azurerm_dns_caa_record.dns_caa_records
}
output "dns_caa_records_fqdn" {
  description = "List of fqdn values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.fqdn]
}
output "dns_caa_records_name" {
  description = "List of name values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.name]
}
output "dns_caa_records_record" {
  description = "List of record values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.record]
}
output "dns_caa_records_resource_group_name" {
  description = "List of resource_group_name values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.resource_group_name]
}
output "dns_caa_records_tags" {
  description = "List of tags values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.tags]
}
output "dns_caa_records_ttl" {
  description = "List of ttl values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.ttl]
}
output "dns_caa_records_zone_name" {
  description = "List of zone_name values across all dns_caa_records"
  value       = [for k, v in azurerm_dns_caa_record.dns_caa_records : v.zone_name]
}

