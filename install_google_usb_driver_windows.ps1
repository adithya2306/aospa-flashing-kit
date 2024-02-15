# Install Google USB Driver
# Credits: https://github.com/mickaelmendes50/dotfiles/blob/main/adb/adb-usb-driver.ps1

trap [Exception] {
    Write-Host "Error:" $_.Exception.Message
    Write-Host "`nPress enter to exit..."
    Read-Host
    Exit 1
}

# Installing driver requires admin privs
if (!([Security.Principal.WindowsPrincipal] `
  [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -Verb runAs -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`""
    Exit
}

$TMP = [System.IO.Path]::GetTempPath()
$GOOGLE_USB_DRIVER_URL = "https://dl.google.com/android/repository/usb_driver_r13-windows.zip"
$GOOGLE_USB_DRIVER_PATH = "$TMP/google_usb_driver.zip"

Write-Host "Downloading USB driver..."
Invoke-WebRequest -Uri "$GOOGLE_USB_DRIVER_URL" -OutFile "$GOOGLE_USB_DRIVER_PATH"

Write-Host "Extracting USB driver..."
Expand-Archive -LiteralPath "$GOOGLE_USB_DRIVER_PATH" -DestinationPath "$TMP"

Write-Host "Installing USB driver..."
Get-ChildItem "$TMP/usb_driver" -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

# Cleanup
Remove-Item "$GOOGLE_USB_DRIVER_PATH"
Remove-Item "$TMP/usb_driver" -Recurse

Write-Host "`nPress enter to exit..."
Read-Host
