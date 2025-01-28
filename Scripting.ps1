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
