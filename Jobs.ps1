# Start a new process job in the background
Start-Job -ScriptBlock {Get-Process}

# List a specific job
Get-Job -Id 1 | Format-List *

# Receive the output from a job
Receive-Job -Id 1

# List all associated childjobs from a parent job
Get-Job -Id 1 | Select-Object -ExpandProperty ChildJobs

# Remove any jobs that we have already received output from
Get-Job | Where-Object {-not $_.HasMoreData} | Remove-Job

# Start a job to find all of the txt files on the filesystem
Start-Job {Get-ChildItem / -Recurse -Filter '*.txt'}

# Start a job that will search for all txt files on remote computers
Invoke-Command -ScriptBlock {Get-ChildItem / -Recurse -Filter '*.txt'} -ComputerName (Get-Content computers.txt) -AsJob

# Keep the output from a job in memory so it can be accessed multiple times
Receive-Job -Id 1 -Keep
