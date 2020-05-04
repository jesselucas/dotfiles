#!/bin/sh

alias jlinkdebug='sudo JLinkGDBServer -device NRF52832_XXAA -if SWD -speed 4000'
alias wba='rm -Rf build && west build -b nrf52_arcreactor_rev_a && cd build'
alias wbdk='rm -Rf build && west build -b nrf52_pca10040 && cd build'
alias wbr='rm -Rf build && west build -b nrf52840_arcreactor_relay && cd build'

alias zmake='rm -Rf build && mkdir build && cd build && cmake -DBOARD=nrf52_arcreactor_rev_a .. && make'
alias zmakedk='rm -Rf build && mkdir build && cd build && cmake -DBOARD=nrf52_pca10040 .. && make'
alias zgdb='arm-none-eabi-gdb zephyr/zephyr.elf -x ~/.gdb/jlink.gdb'


alias zmaker='rm -Rf build && mkdir build && cd build && cmake -DBOARD=nrf52840_arcreactor_relay .. && make'

alias hexjlink='sudo JLinkExe -device NRF52832_XXAA -if SWD -speed 4000 -autoconnect  1'

alias jlinkrtt='sudo JLinkRTTLogger -Device NRF52832_XXAA -if SWD -speed 4000 -RTTAddress auto-detection -RTTChannel 0 /dev/stdout'
