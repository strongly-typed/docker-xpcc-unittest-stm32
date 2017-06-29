target remote OPENOCD_IP:3333
monitor reset halt
monitor stm32l4x mass_erase 0
load
monitor reset run
