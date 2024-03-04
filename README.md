# AOSPA flashing kit for Marble

Scripts to flash firmware and ROM on windows/mac/linux, including latest platform-tools and drivers, for AOSPA - Poco F5 / Redmi Note 12 Turbo.

## Steps

1. Download the latest fastboot package from https://paranoidandroid.co/marble/
2. Copy it to this folder and rename it to aospa.zip
3. Download the latest Android 14 firmware for your variant from https://xiaomifirmwareupdater.com/firmware/marble/ (see note below for RN12T)
4. Copy it to this folder and rename it to firmware.zip
5. Run install_google_usb_driver (Windows users only; requires admin)
6. Reboot to bootloader (`adb reboot bootloader` OR shutdown phone and long press power + volume down button)
7. Run flash_firmware
8. Run flash_aospa

### Notes
- `.cmd` scripts are for windows, can be run by right click -> run as administrator.
- `.sh` scripts are for linux and mac, you should know how to use them!
- You may see warnings like `Warning: skip copying xyz image avb footer` while flashing firmware, this is normal and can be ignored safely.
- The device will reboot automatically into "AOSPA Fastboot" (fastbootd) during ROM flash, this is normal and expected behaviour.
- These scripts do not wipe data.
