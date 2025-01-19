# Check for the 8.3 shortname of a folder with whitespace
Get-CimInstance Win32_Directory -Filter 'Name="C:\\Program Files"' | Select-Object EightDotThreeFileName

# Enabling PowerShell remoting via WinRM
Enable-PSRemoting

# Remote to a computer and use a specific user
Enter-PSSession -ComputerName W10-Desktop -Credential Domain\Administrator
Start-Process Notepad

# Stop a remote session
Exit-PSSession

# Run a remote command across multiple computers with scriptblock
Invoke-Command -ComputerName W10-Desktop,W11-Desktop -ScriptBlock {Get-Process powershell} -Credential Administrator
Invoke-Command -ComputerName (Get-Content C:\Users\User1\hostnames.txt) -ScriptBlock {Get-Process} -Credential Administrator

# Distinguishing the deserialized objects associated with the remote command
Invoke-Command {Get-Process} -ComputerName W10-Desktop -Credential Administrator | Get-Member

# Get a list of running processes on multiple remote computers and sort by virtual memory usage and return the top 10 hits
Invoke-Command -ScriptBlock {Get-Process | Sort-Object VM -Descending | Select-Object -First 10} -ComputerName W10-Desktop,W11-Desktop -Credential Administrator

# Retrieve the newest files from the home directory from multiple remote hosts
Invoke-Command -ScriptBlock {Get-ChildItem ~\* | Sort-Object -Property LastWriteTime -Descending | Select-Object -First 10} -ComputerName (Get-Content C:\Users\User1\hostnames.txt) -Credential Administrator
