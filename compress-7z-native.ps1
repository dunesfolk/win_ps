# Ensure the 7Zip4PowerShell module is installed
if (-not (Get-Module -ListAvailable -Name 7Zip4PowerShell)) {
    Install-Module -Name 7Zip4PowerShell -Scope CurrentUser -Force
}

Import-Module 7Zip4PowerShell

# Get all items in the current directory
$items = Get-ChildItem -Path . -Force | Where-Object { $_.Name -ne '.' -and $_.Name -ne '..' }

foreach ($item in $items) {
    $archiveName = "$($item.Name).7z"
    Compress-7Zip -ArchiveFileName $archiveName -Path $item.FullName -CompressionLevel Ultra

    Write-Host "Compressed $($item.Name) to $archiveName"
}
