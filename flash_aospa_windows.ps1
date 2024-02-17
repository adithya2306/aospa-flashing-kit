# Flash AOSPA fastboot zip on marble
# Author: Adithya R (@ghostrider_reborn)

trap [Exception] {
    Write-Host "Error:" $_.Exception.Message
    Write-Host "`nPress enter to exit..."
    Read-Host
    Exit 1
}

# ROM zip must be stored as aospa.zip
$ZipPath = if (Test-Path "$PSScriptRoot/aospa.zip") {
    "$PSScriptRoot/aospa.zip"
# or aospa.zip.zip because explorer doesn't show file extension by default ;)
} elseif (Test-Path "$PSScriptRoot/aospa.zip.zip") {
    "$PSScriptRoot/aospa.zip.zip"
} else {
    throw "aospa.zip not found, download and place it first."
}

Write-Host "Flashing aospa.zip..."
& "$PSScriptRoot/platform-tools-windows/fastboot" update --skip-reboot "$ZipPath"
if (!$?) {
    throw "Flashing failed!"
}

Write-Host "`nCompleted succesfully!`nPress enter to exit..."
Read-Host