@echo off
:: Flash AOSPA fastboot zip on marble
:: Author: Adithya R (@ghostrider_reborn)

if exist "%~dp0aospa.zip" (
    set rom_zip=%~dp0aospa.zip
) else (
    if exist "%~dp0aospa.zip.zip" (
        set rom_zip=%~dp0aospa.zip.zip
    ) else (
        echo Error: aospa.zip not found!
        goto :exit
    )
)

set fastboot=%~dp0platform-tools-windows\fastboot.exe

echo Flashing aospa.zip ...
"%fastboot%" update --skip-reboot "%rom_zip%"
if ERRORLEVEL 1 (
    echo Error: Flashing aospa.zip failed!
    goto :exit
)

echo:
echo Completed succesfully!

:exit
pause