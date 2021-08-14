output "dn" {
  value       = aci_rest.vzOOBBrCP.id
  description = "Distinguished name of `vzOOBBrCP` object."
}

output "name" {
  value       = aci_rest.vzOOBBrCP.content.name
  description = "OOB contract name."
}
