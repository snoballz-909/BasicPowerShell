# There are 4 formatting cmdlets in PowerShell
# Format-Table, Format-List, Format-Wide and Format-Custom

# Get a list of processes and format the table to only show the specific properties and wrap the output to prevent missing text
Get-Process | Format-Table -Property ID,Name,Responding -Wrap

# Get a list of processes, sort by name and format the specified properties by the PID
Get-Process | Sort-Object Name | Format-Table -Property ID,Name,Responding -GroupBy ID

# Format a cmdlet by list
Get-Verb | Format-List *

# Get a list of processes and format the output by a single property by 4 columns wide
Get-Process | Format-Wide name -col 4

# Get a list of running processes, format the table with a custom hash table by creating a custom column name called 'VM()MB' and dividing that value by 1MB and outputing to an integer
Get-Process | Format-Table Name, @{name='VM(MB)';expression={$_.VM / 1MB -as [int]}}

# Get a list of process names and PIDs but include columns for virtual and physical memory usage expressed in MB
Get-Process | Format-Table -Property Name,ID, @{l='VirtualMB';e={$_.vm / 1MB}}, @{l='PhysicalMB';e={$_.workingset / 1MB}}

# Use grid outview to list processes via GUI
Get-Process | Out-GridView

# Display a 4 column wide list of directories in the home directory
Get-ChildItem ~ -Directory | Format-Wide -Column 4

# Create a formatted list of all .dll files in $pshome, display specific properties and change a property name to 'Size'
Get-ChildItem $pshome/*.dll | Format-List Name,VersionInfo,@{n='Size';e={$_.length}}
