# AOSPA flashing kit for Marble

Scripts to flash firmware and ROM on windows/mac/linux, including latest platform-tools and drivers, for AOSPA - Poco F5 / Redmi Note 12 Turbo.

## Steps

1. Download the latest fastboot package from https://paranoidandroid.co/marble/
2. Copy it to this folder and rename it to aospa.zip
3. Download the latest Android 14 firmware for your variant from https://xiaomifirmwareupdater.com/firmware/marble/
4. Copy it to this folder and rename it to firmware.zip
5. Run the appropriate scripts in the following order:
   1. install_google_usb_driver (Windows users only; requires admin)
   2. flash_firmware
   3. flash_aospa

### Notes
- `.ps1` scripts are for windows, can be run by right click -> run with powershell.  
  If powershell window closes immediately after running, try shift + right click on empty space in folder -> Open powershell window here -> enter `./script_name.ps1`.
- `.sh` scripts are for linux and mac, you should know how to use them!
- __Android 14 firmware for Redmi Note 12 Turbo (China)__ is not yet uploaded to xiaomifirmwareupdater (as of 16/Feb/2024), instead get it from https://pixeldrain.com/u/4BXDLY1W
- You may see warnings like `Warning: skip copying xyz image avb footer` while flashing firmware, this is normal and can be ignored safely.
- The device will reboot automatically into "AOSPA Fastboot" (fastbootd) during ROM flash, this is normal and expected behaviour.
