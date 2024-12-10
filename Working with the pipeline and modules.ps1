# Comparing the differences of 2 text files
Compare-Object -ReferenceObject (Get-Content .\File1.txt) -DifferenceObject (Get-Content .\File2.txt)

# Export an XML file with CliXML and then compare that file to running processes on a different machine
Get-Process | Export-Clixml ref.xml
Compare-Object -ReferenceObject (Import-Clixml .\ref.xml) -DifferenceObject (Get-Process) -Property Name

# Creating a pipe delimited file instead of standard CSV output
Get-Command | Export-CSV commands.csv -Delimiter "|"

# Prevent the export output from overwriting a file "-NoClobber" and prompt the user to confirm before executing command
Get-Process | Export-CSV procs.csv -NoClobber -Confirm

# Creation of a Test folder and 10 files within that folder
New-Item ~\TestFolder -ItemType Directory
1..10 | foreach {New-Item "~\TestFolder\$_.txt" -ItemType File -Value $_}

# Install the Azure module
Install-Module -Name Az

# List locally available modules
Get-Module az -ListAvailable

# List module enviornment path variable
Get-Content Env:\PSModulePath

# Assign modules that are located outside the enviornment path variable
$env:PSModulePath += [System.IO.Path]::PathSeparator + 'C:\Scripts\myModules'

# Importing a module outside of the PSModulePath
Import-Module C:\Scripts\myModule

# Find the archiving module and force install it
Find-Module -Command Compress-Archive | Install-Module -Force

# Compress everything in a folder
Compress-Archive -Path ~\TestFolder\* -DestinationPath ~\TestFolder\TestFolder.zip

# Extract the files from a zip to another folder
Expand-Archive ~\TestFolder\TestFolder.zip -DestinationPath ~\TestFolder2

# Create 2 variables listing the contents of each folder and then compare them to see if there is any differences
$reference = Get-ChildItem ~\TestFolder | Select-Object -ExpandProperty name
$difference = Get-ChildItem ~\TestFolder2 | Select-Object -ExpandProperty name
Compare-Object -ReferenceObject $reference -DifferenceObject $difference

# Remove every folder and its contents with the string "TestFolder"
Remove-Item ~\TestFolder* -Force -Recurse
