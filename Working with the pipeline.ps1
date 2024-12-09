# Comparing the differences of 2 text files
Compare-Object -ReferenceObject (Get-Content .\File1.txt) -DifferenceObject (Get-Content .\File2.txt)

# Export an XML file with CliXML and then compare that file to running processes on a different machine
Get-Process | Export-Clixml ref.xml
Compare-Object -ReferenceObject (Import-Clixml .\ref.xml) -DifferenceObject (Get-Process) -Property Name

# Creating a pipe delimited file instead of standard CSV output
Get-Command | Export-CSV commands.csv -Delimiter "|"

# Prevent the export output from overwriting a file "-NoClobber" and prompt the user to confirm before executing command
Get-Process | Export-CSV procs.csv -NoClobber -Confirm
