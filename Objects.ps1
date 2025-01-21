# Get the Objects, Properties and Method members for "Get-Process"
Get-Process | Get-Member

# Sorting the "CPU" Object in Descending order
Get-Process | Sort-Object CPU,ID -Descending

# Selecting specific Objects from "Get-Process" and outputting to HTML
Get-Process | Select-Object -Property Name,ID,CPU,PM | ConvertTo-Html | Out-File test2.html

# Listing contents of a directory, sorting by last write time, selecting specific Objects and exporting to CSV
Get-ChildItem | Sort-Object LastWriteTime -Descending | Select-Object Name,CreationTime,LastWriteTime | Export-Csv output1.csv
