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
    Start-Process powershell.exe -ArgumentList "cd $PSScriptRoot; $PSCommandPath" -Verb RunAs
    Exit
}

Write-Host "Installing USB driver..."
Get-ChildItem "usb_driver-windows" -Recurse -Filter "*.inf" | 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install }

Write-Host "`nPress enter to exit..."
Read-Host
