cd ~/klipper

echo -e -n "\e[0;31mStopping Klipper Service. "
echo -e -n '\e[0;0m'

sudo systemctl stop klipper
sudo systemctl status klipper

################################################################################

git pull

################################################################################

# Flash main MCU - BTT Otopus v1.1

################################################################################
make clean KCONFIG_CONFIG=klipper-bigtreetech-octopus.config
make menuconfig KCONFIG_CONFIG=klipper-bigtreetech-octopus.config
make -j4 KCONFIG_CONFIG=klipper-bigtreetech-octopus.config

echo -e -n "\e[0;33mBTT Octopus MCU firmware built, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32f446xx_25004D000F50535556323420-if00 KCONFIG_CONFIG=klipper-bigtreetech-octopus.config
make flash FLASH_DEVICE=/dev/serial/by-id/usb-katapult_stm32f446xx_25004D000F50535556323420-if00 KCONFIG_CONFIG=klipper-bigtreetech-octopus.config

echo -e -n "\e[0;33mBTT Octopus MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read


################################################################################

# Flash secondary MCU - BTT EBB36 v1.2

################################################################################
make clean KCONFIG_CONFIG=klipper-btt-ebb36-v1.2.config
make menuconfig KCONFIG_CONFIG=klipper-btt-ebb36-v1.2.config
make -j 4 KCONFIG_CONFIG=klipper-btt-ebb36-v1.2.config

echo -e -n "\e[0;33mBTT EBB36 v1.2 MCU firmware built, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

# make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32g0b1xx_40004B001750425539393020-if00 KCONFIG_CONFIG=klipper-btt-ebb36-v1.2.config
make flash FLASH_DEVICE=/dev/serial/by-id/usb-katapult_stm32g0b1xx_260031001750425539393020-if00 KCONFIG_CONFIG=klipper-btt-ebb36-v1.2.config

echo -e -n "\e[0;33mBTT EBB36 v1.2 MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

################################################################################

# Flash secondary MCU - BTT MMB v1.1

################################################################################
make clean KCONFIG_CONFIG=klipper-btt-mmb-v1.1.config
make menuconfig KCONFIG_CONFIG=klipper-btt-mmb-v1.1.config
make -j 4 KCONFIG_CONFIG=klipper-btt-mmb-v1.1.config

echo -e -n "\e[0;33mBTT MMB v1.1 MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32g0b1xx_1F0013000A50304158373420-if00 KCONFIG_CONFIG=klipper-btt-mmb-v1.1.config
make flash FLASH_DEVICE=/dev/serial/by-id/usb-katapult_stm32g0b1xx_1F0013000A50304158373420-if00 KCONFIG_CONFIG=klipper-btt-mmb-v1.1.config

echo -e -n "\e[0;33mBTT MMB v1.1 MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read


################################################################################

# Flash Host MCU - Raspberry Pi

################################################################################
make clean KCONFIG_CONFIG=klipper-raspberry-pi.config
make menuconfig KCONFIG_CONFIG=klipper-raspberry-pi.config
make -j 4 KCONFIG_CONFIG=klipper-raspberry-pi.config

echo -e -n "\e[0;33mRaspberry Pi MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

make flash KCONFIG_CONFIG=klipper-raspberry-pi.config

echo -e -n "\e[0;33mRaspberry Pi MCU firmware flashed, please check above for any errors. "
echo -e -n "\e[0;33mPress [Enter] to continue flashing, or [Ctrl+C] to abort"
echo -e -n '\e[0;0m'
read

################################################################################

echo -e -n "\e[0;32mStarting Klipper Service."
echo -e -n '\e[0;0m'
sudo systemctl start klipper
sudo systemctl status klipper

exit 0
