# docker-xpcc-unittest-stm32
Docker container for building and running unittest on STM32.

## Automatically running unittest on ST Nucleo L476RG using Docker

1. Connect a ST Nucleo L476RG board to your computer.
1. Fire up a serial terminal to the VCP of the board, e.g.
     ```
     picocom -b 115200 --imap lfcrlf /dev/tty.usbmodem1423
     ```
1. Fire up an OpenOCD
     ```
    openocd -f board/stm32l4discovery.cfg -s tools/openocd -c " init" -c " reset halt"
     ```
1. Get the IP of your computer to which OpenOCD is running, e.g.
     ```
    IP=`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'`
     ```
1. Run this Docker container
   ```
   docker run -e OPENOCD_IP=${IP} -e BOARD=nucleo_l476rg stronglytyped/xpcc-unittest-stm32
   ```
1. Observe the output in your serial terminal
   ```
   Unittests (Jun 30 2017, 00:35:02)
   Machine:  13c382e98832
   User:     root
   Os:       Ubuntu 16.04 xenial
   Compiler: arm-none-eabi-g++ (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]
   Local Git User:
   Name:
   Email:
   Last Commit:
   SHA:             faca725834af311436f78f182eca88e86ca10d0c
   Abbreviated SHA: faca725
   Subject:         [travis] Update arm-none-eabi-gcc to 2017q2.
   ```
1. After some time the final result of the unittest will be displayed
   ```
   Passed 3847 tests
   OK!
   ```

