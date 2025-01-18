# Get a list of running processes with over 100MB usgae and time active of over 10 mins
Get-Process | Where-Object {$_.WorkingSet -gt 100MB -and $_.CPU -gt 10}

# Get a listof running processes excluding powershell.exe and sort by virtual memory in descending order, select the first 10 outputs and then get the count of objects and value of the virtual memory combined
Get-Process | Where-Object {$_.Name -notlike 'powershell*'} | Sort-Object VM -Descending | Select-Object -First 10 | Measure-Object -Property VM -Sum

# Get the commands from the PSReadLine module using the verb "get"
Get-Command Get-* -Module PSReadLine

# List all files in the Windows directory that are larger than 1MB
Get-ChildItem C:\Windows | Where-Object {$_.Length -gt 1MB}

# Find modules in PowerShell Gallery that start with "PS" and the author is Microsoft
Find-Module -Name PS* | Where-Object {$_.Author -like 'Microsoft*'}

# List all files in the current directory where the last write time is in the last week
Get-ChildItem . | Where-Object LastWriteTime -ge (Get-Date).AddDays(-7)

# Get a list of processes the have the name "powershell" or "bash"
Get-Process -Name powershell,bash
Get-Process | Where-Object {$_.Name -like 'powershell*' -or $_.Name -like 'bash*'}
