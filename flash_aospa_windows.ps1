# Flash AOSPA fastboot zip on marble
# Author: Adithya R (@ghostrider_reborn)

trap [Exception] {
    Write-Host "Error:" $_.Exception.Message
    Write-Host "`nPress enter to exit..."
    Read-Host
    Exit 1
}

# ROM zip must be stored as aospa.zip
if (!(Test-Path "aospa.zip")) {
    throw "aospa.zip not found, download and place it first."
}

Write-Host "Flashing aospa.zip..."
./platform-tools-windows/fastboot update --skip-reboot aospa.zip
if (!$?) {
    throw "Flashing failed!"
}

Write-Host "`nCompleted succesfully!`nPress enter to exit..."
Read-Host