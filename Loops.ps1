# Creating an array of numbers 1 to 10 and then iterate through the numbers with a for loop
# NOTE: "Foreach" is different to "Foreach-Object"
# Foreach will simply iterate through the values in a collection of items
# Foreach-Object is often used to iterate though objects in a pipeline
$array = 1..10
foreach ($a in $array){Write-Output $a}

# List files in a directory and iterate through the "Name" properties from the object sent down the pipeline
Get-ChildItem | ForEach-Object {$_.Name}

# Using a while loop until condition si satisfied
$n = 1
While ($n -le 10){Write-Output $n; $n++}

# Using for loop to count number of characters in each filename
$items = Get-ChildItem .
ForEach ($i in $items){Write-Output "The character length of $i is "($i).Length}

# Start a process and use do while loop that will display text on terminal until the process is closed
Start-Process notepad
$Process = "notepad"
do {Write-Host "$Process is open"} while ((Get-Process).name -contains "notepad")
