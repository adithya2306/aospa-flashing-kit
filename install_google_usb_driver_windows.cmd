@echo off
:: Install Google Android USB driver
:: Credits: https://github.com/mickaelmendes50/dotfiles/blob/main/adb/adb-usb-driver.ps1
:: Author: Adithya R (@ghostrider_reborn)

set drivers=%~dp0usb_driver-windows

echo Installing USB driver ...
PNPUtil.exe /add-driver "%drivers%\android_winusb.inf" /install

pause