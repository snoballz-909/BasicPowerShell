# Using the "match" parameter to match regular expressions
"car" -match "C[aeiou]r"
"caaar" -match "C[aeiou]+r"

# Parsing a weblog file to search for 40x HTTP status codes and then formatting the output table
Get-ChildItem -Filter *.log -Recurse | Select-String -Pattern "\s40[0-9]\s" | Format-Table Filename,LineNumber,Line -Wrap

# Parsing another weblog file to search for a specific user agent and outputting raw
# 10\.0; = Looking for a string literal of "10.0;"
# [/W/w]+ = Essentially means look for one or more word or non word characters (anything)
# \+Gecko = Looking for a string literal of "+Gecko"
Get-ChildItem -Filter *.log -Recurse | Select-String -Pattern "10\.0;[/W/w]+\+Gecko"

# Parsing Windows Event Logs(security) for event ID and regex matching specific naming convention
# [234] = a set of 2,3 or 4
# [0-9] = any digit from 0 to 9
# \$ = escaping the special meaning of "$" so its treated as a string literal
Get-EventLog -LogName Security | Where-Object {$_.EventID -eq 4624} | Select-Object -ExpandProperty Message | Select-String -Pattern "WIN[\W\w]+TM[234][0-9]\$"
Get-EventLog -LogName Security | Where-Object {$_.EventID -eq 4624 -and $_.Message -match "DESKTOP[\W\w]"}

# Get all files in Windows directory that have a 2 digit number in name
Get-ChildItem C:\Windows | Where-Object {$_.Name -match "\d{2}"}

# Find all modules loaded on computer that are from Microsoft and display specific properties
Get-Module | Where-Object {$_.CompanyName -match "^Microsoft"} | Select-Object Name,Version,Author,CompanyName

# Find installed updates from the Windows Update log
Get-Content C:\Windows\WindowsUpdate.log | Select-String "[\w+\W+]Installing Update"

# Display all IPv4 listings in the DNS client cache
Get-DnsClientCache | Where-Object {$_.Data -match "^\d{1,3}\."}
