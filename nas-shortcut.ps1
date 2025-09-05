$TARGET_NAME = Read-Host "Enter the target name";
$USER_NAME = Read-Host "Enter the user name";
$PASS = Read-Host "Enter the pass";
cmdkey /add:${TARGET_NAME} /user:${USER_NAME} /pass:${PASS}
$WshShell = New-Object -ComObject WScript.Shell; 
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\${TARGET_NAME}.lnk"); 
$Shortcut.TargetPath = "\\${TARGET_NAME}\";
$Shortcut.Save();
Start-Sleep -Seconds 1;
