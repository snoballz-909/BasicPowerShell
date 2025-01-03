# Importing a CSV of new alias to define
Import-Csv .\aliases.txt | New-Alias

# Importing a CSV of new users, parsing that CSV file via the pipeline and using the AD module to create those new users with the relevant properties
Import-Csv .\newusers.csv | Select-Object -Property *, @{name='samAccountName';Expression={$_.login}}, @{label='Name';expression{$_.login}}, @{n='Department';e={$_.dept}} | New-ADUser

# Retreive a list of commands from any locally installed module thats starts with the word "Microsoft"
Get-Command -Module (Get-Module -ListAvailable -Name Microsoft.* | Select-Object -ExpandProperty name)
