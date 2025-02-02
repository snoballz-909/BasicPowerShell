# Create a function that will get the uptime on remote machines including error handling such as Try and Catch statements
Function Get-Uptime {
    param (
        [string[]]$Computername = "localhost"
        )
    try {
        foreach ($computer in $Computername) {
            If ($computer -eq 'localhost') {
                (Get-ComputerInfo).OsUptime
            }
            Else {Invoke-Command -ComputerName $computer -ScriptBlock {(Get-ComputerInfo).OsUptime} -ErrorAction Stop }
        }
    }
    catch {
        Write-Error "cannot connect to $computer"
    }
}
Get-Uptime
