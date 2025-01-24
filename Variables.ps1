# Defining a variable by listing propeties in that variable and then putting the first property into a string
$proc = Get-Process | Where-Object {$_.Name}
$firstproc = "The first name is $($proc[0].Name)"
$firstproc

# Prompt a user to enter a number and ensure PowerShell treats that number as an int and not a str
[int]$number = Read-Host "Enter a Number"
$number | Get-Member # ensure the variable if of integer object type
$number = $number * 10
$number

# Create a background job that gets all processes specific name from 2 remote devices then recieve the results of the job by calling another variable
Invoke-Command {Get-Process powershell} -ComputerName localhost,$env:computername -AsJob
$results = Recieve-Job 4 -Keep
$results

# Export the contents of the variable into a CLIXML file
$results = | Export-CliXml processes.xml

# Store print spooler and bits job services in a variable and then export as a CSV
$services = Get-Service -Name bits,spooler
$services
$services | Export-Csv -Path C:\services.csv
