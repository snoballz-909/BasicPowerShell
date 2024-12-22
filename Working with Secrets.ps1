# Finding a module via PowerShell gallary for managing and storing secrets
Find-Module *secret* | Format-Table -Auto

# Installing the SecretManagement and SecretStore modules
Install-Module -Name Microsoft.PowerShell.SecretManagement
Install-Module -Name Microsoft.PowerShell.SecretStore

# Listing the commands of the SecretManagement module
Get-Command -Module Microsoft.PowerShell.SecretManagement

# Registering a SecretManagement vault for the current user
Register-SecretVault -Name LocalStore -ModuleName Microsoft.PowerShell.SecretStore -DefaultVault

# Set a password for the secret store vault
Set-SecretStorePassword

# Store a secret by name inside the specified vault and retrive the secret
Set-Secret -Name Test1 -Secret "SuperSecretValue" -Vault LocalStore
Get-Secret -Vault LocalStore -Name Test1
