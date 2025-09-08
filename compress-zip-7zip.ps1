# Path to 7-Zip executable
$PATH_7zip = "C:\Program Files\7-Zip\7z.exe"

# Get all folders in the current directory
$folders = Get-ChildItem -Directory

foreach ($folder in $folders) {
    $folderName = $folder.Name
    $folderPath = $folder.FullName
    $zipFileName = "$folderName.zip"
    $zipFilePath = Join-Path -Path $PWD -ChildPath $zipFileName

    # Build the 7z command for maximum compression (-mx=9)
    $arguments = "a -tzip -mx=9 `"$zipFilePath`" `"$folderPath\*`""

    # Run the 7z command
    Start-Process -FilePath $PATH_7zip -ArgumentList $arguments -NoNewWindow -Wait

    Write-Host "Compressed $folderName to $zipFileName"
}
