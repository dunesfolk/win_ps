# Define the path to 7-Zip executable
$PATH_7zip = "C:\Program Files\7-Zip\7z.exe"

# Get the current directory
$PATH_target = Get-Location

# Set compression level
$compression_level = 9

# Get all items (files and folders) in the current directory
$items = Get-ChildItem -Path $PATH_target

foreach ($item in $items) {
    $itemName = $item.Name
    $itemFullPath = $item.FullName
    $archiveName = "$itemName.7z"
    $archivePath = Join-Path -Path $PATH_target -ChildPath $archiveName

    # Build the 7-Zip command
    $arguments = "a -mx=$compression_level `"$archivePath`" `"$itemFullPath`""

    # Run the 7-Zip command
    Start-Process -FilePath $PATH_7zip -ArgumentList $arguments -NoNewWindow -Wait
    Write-Host "Compressed $itemName to $archiveName"
}
