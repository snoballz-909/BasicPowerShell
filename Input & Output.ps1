# Use write output to display the result of 100 times 10
Write-Output (100 * 10)

# Use write host to display the result of 100 times 10
$number = 100 * 10
Write-Host $number

# Prompt a user to enter a name and display that name in yellow
$display = Read-Host "Enter a name"
Write-Host $display -ForegroundColor Yellow

# Prompt a user to enter a name and display that name if longer than 5 characters
Read-Host "Enter Name" | Where-Object {$_.Length -gt 5}

# Alternative output cmds and how to configure them
Write-Warning
$WarningPreference="Continue"

Write-Verbose
$VerbosePreference="Continue"

Write-Debug
Write-Error
Write-Information
