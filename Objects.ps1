# Get the Objects, Properties and Method members for "Get-Process"
Get-Process | Get-Member

# Sorting the "CPU" Object in Descending order
Get-Process | Sort-Object CPU,ID -Descending

# Selecting specific Objects from "Get-Process" and outputting to HTML
Get-Process | Select-Object -Property Name,ID,CPU,PM | ConvertTo-Html | Out-File test2.html

# Listing contents of a directory, sorting by last write time, selecting specific Objects and exporting to CSV
Get-ChildItem | Sort-Object LastWriteTime -Descending | Select-Object Name,CreationTime,LastWriteTime | Export-Csv output1.csv

# Get all items from the current directory and copy them to a folder but use "PassThru" to display the contents on the terminal
Get-ChildItem .\ | Copy-Item -Destination C:\Test -PassThru

# Get adapter properties by calling the CIM class and searching for the service name
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "ServiceName like '%VMnet%'" | Format-List

# Find out all of the associated methods of the object
(Get-CimClass Win32_NetworkAdapterConfiguration).CimClassMethods

# Enable the DHCP on the adapter via invoke CIM method
Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "ServiceName like '%VMnet%'" | Invoke-CimMethod -MethodName EnableDHCP

# Get the method types for the cmdlet Get-ChildItem
Get-ChildItem | Get-Member -MemberType Method

# Get all items in a directory that contains "delete" and delete them
Get-ChildItem *delete* | Remove-Item -Recurse -Force

# Display a list of names in upper case
Get-Content .\Test.txt | ForEach-Object {$_.ToUpper()}
