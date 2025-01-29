# The following is an example script which showcases a multi line comment, adding a help section to your script and parameterizing variables so a user can run the script with defined parameters

<#
.SYNOPSIS
This script retrieves logical disk information from 1 or more computers.
.DESCRIPTION
Uses CIM to retrieve the Win32_LogicalDisk instances from computers by querying disk drive letter, free space, total size and percentage free.
.PARAMETER computername
The computer name to specify, set to localhost by default
.PARAMETER drivetype
The drivetype to specify, set to drive 3 by default
.EXAMPLE
.\script -computername Win10 -drivetype 3
#>

param (
    $computername = 'localhost',
    $drivetype = 3
)
Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $computername `
-Filter "drivetype=$drivetype" |
Sort-Object -Property DeviceID |
Format-Table -Property DeviceID,
    @{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
    @{label='Size(GB)';expression={$_.Size / 1GB -as [int]}},
    @{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}

# In the above example a backtick was used after $computername to demonstrate an escape of the carrige return on execution of the script. The command will continue as normal on the following line.


# The following is an improved example of the same script but with a couple of different changes such as removing the format table cmdlet and replacing with select object to allow us to export to a CSV with the relevant parameters.
# Added the cmdlet binding line to enable more advanced features to the script.
# Added mandatory parameter so if a user forgets to include a parameter, they will be prompted regardless
# Added validate set to only accpet specific input from the user
# Added verbose output within the script to then be able to run the script the the added verbosity

<#
.SYNOPSIS
This script retrieves logical disk information from 1 or more computers.
.DESCRIPTION
Uses CIM to retrieve the Win32_LogicalDisk instances from computers by querying disk drive letter, free space, total size and percentage free.
.PARAMETER computername
The computer name to specify, set to localhost by default
.PARAMETER drivetype
The drivetype to specify, set to drive 3 by default
.EXAMPLE
.\script -computername Win10 -drivetype 3
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory=$True)]
    $computername = 'localhost',
    [ValidateSet(2,3)]
    $drivetype = 3
)
Write-Verbose "Connecting to $computername"
Write-Verbose "Looking for drive type $drivetype"
Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $computername `
-Filter "drivetype=$drivetype" |
Sort-Object -Property DeviceID |
Select-Object -Property DeviceID,
    @{label='FreeSpace(MB)';expression={$_.FreeSpace / 1MB -as [int]}},
    @{label='Size(GB)';expression={$_.Size / 1GB -as [int]}},
    @{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}
Write-Verbose "Finished running script"

# .\script.ps1 | Export-CSV
# .\script.ps1 -Verbose <-- to see verbose output
