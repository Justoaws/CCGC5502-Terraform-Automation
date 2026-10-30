output "log_analytics_workspace_name" {
  description = "Log Analytics workspace name"
  value       = azurerm_log_analytics_workspace.this.name
}

output "recovery_services_vault_name" {
  description = "Recovery Services vault name"
  value       = azurerm_recovery_services_vault.this.name
}

output "storage_account_name" {
  description = "Shared storage account name"
  value       = azurerm_storage_account.this.name
}

output "storage_account_id" {
  description = "Shared storage account ID"
  value       = azurerm_storage_account.this.id
}

output "storage_account_primary_blob_endpoint" {
  description = "Primary Blob endpoint for boot diagnostics"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}
