# Updating the Help manual
Update-Help -Force

# Searching for a cmdlet by its function or name
Get-Command -Noun file,printer
Get-Command -Noun process

# Searching a cmdlet for both a Verb and Noun or using help
Get-Command -Verb set -Noun psbreakpoint
help *break*

# Using help to search the Name parameter for Get-Process
help Get-Process -Parameter Name

# Using help to search the computername parameter for Invoke-Command
help Invoke-Command -Parameter computername

# List all aliases defined
Get-Alias

# Using both a cmdlet alias and a parameter abbreviation for Get-Command
gcm -na *process*

# Display a list of running processes or process name beginning with p
Get-Process
gps -Name p*

# Test a connection to google.com (equivalent to a ping)
Test-Connection google.com

# Display list of all cmdlet types
Get-Command -Type cmdlet

# Creating a new alias for netstat
New-Alias -Name ntst -Value netstat

# Create 2 new folders in the C:\scripts directory
New-Item -Name MyFolder1 -Path C:\scripts -Type Directory; New-Item -Name MyFolder2 -Path C:\scripts -Type Directory

# Delete every folder beginning with "MyFolder"
Remove-Item C:\Scripts\MyFolder*

# Listing PowerShell providers
Get-PSProvider

# Creating a new directory
New-Item -Path ~/Labs -ItemType Directory

# Creating a new file
New-Item -Path ~/Labs -Name test.txt -ItemType File

# Display all system environment variables
Get-Item env:*
