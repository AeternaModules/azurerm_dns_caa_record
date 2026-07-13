variable "dns_caa_records" {
  description = <<EOT
Map of dns_caa_records, attributes below
Required:
    - name
    - resource_group_name
    - ttl
    - zone_name
    - record (block):
        - flags (required)
        - tag (required)
        - value (required)
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    ttl                 = number
    zone_name           = string
    tags                = optional(map(string))
    record = list(object({
      flags = number
      tag   = string
      value = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        length(v.record) >= 1
      )
    ])
    error_message = "Each record list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        alltrue([for item in v.record : (contains(["issue", "issuewild", "iodef", "contactemail"], item.tag))])
      )
    ])
    error_message = "must be one of: issue, issuewild, iodef, contactemail"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_caa_records : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

