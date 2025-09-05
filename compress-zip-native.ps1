# Get all directories in the current location
$folders = Get-ChildItem -Directory

# Zip all items in the current folder
foreach ($folder in $folders) {
    $zipFileName = "$($folder.Name).zip"
    $zipFilePath = Join-Path -Path $PWD -ChildPath $zipFileName

    # Compress the folder
    Compress-Archive -Path $folder.FullName -DestinationPath $zipFilePath -CompressionLevel Optimal

    Write-Host "Zipped $($folder.Name) to $zipFileName"
}
