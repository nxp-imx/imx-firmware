The helper_uart is a UART download helper for boosting firmware UART
download speed.

Without such a helper, the normal firmware download baudrate is fixed
to 115200bps by bootrom code. When using the helper, the bootrom first
download the helper itself at the fixed baudrate. Then the helper
runs and changes the UART baudrate to a higher speed, say 3Mbps. And
finally the firmware is downloaded at this high speed to save the
total download time.

The helper is very small, less than 3KB. So it can be downloaded very
fast even at 115200bps baudrate. Time saved using higher baudrate for
downloading firmware easily compensate for the time in downloading
the small helper itself. 

Uart download related files:
       |-fw_loader_arm
       |-fw_loader_linux
       |-fw_loader_win.exe
       |-helper_uart_115200.bin
       |-helper_uart_230400.bin
       |-helper_uart_921600.bin
       |-helper_uart_2000000.bin
       |-helper_uart_3000000.bin
       |-helper_uart_3250000.bin

Eg: fw_loader.exe com1 115200 0 helper_uart_3000000.bin

How to download the FW image:
We use a marvell proprietary protocol to download the FW image.
Please refer to UART_HELPER.txt for more details on the protocol.

We use the new helper protocol to download both the helper and the FW image.

Once the FW is downloaded on the chip, it automatically starts running
from its entry point. 

There are different fw_loader executables available depending on the 
Platform on which it is to be run.

Boot ROM code does not enable UART HW flow control. This means that while 
downloading the helper, Flow Control should be disabled. Once the helper 
is downloaded, Flow Control should be set to 1, to download the FW.

<Format: fw_loader_win.exe ComPort BaudRate FlowControl FileName>

e.g.
Windows:
Download Helper:
     fw_loader_win.exe com1 115200 0 helper_uart_3000000.bin
Download FW image at specified BaudRate:
     fw_loader_win.exe com1 3000000 1 firmware.image

Linux:
Download Helper:
     ./fw_loader_linux /dev/ttyUSB# 115200 0 helper_uart_3000000.bin
Download FW image at specified BaudRate:
     ./fw_loader_linux /dev/ttyUSB# 3000000 1 firmware.image

Saar:
Download Helper:
     ./fw_loader_arm /dev/ttyUSB# 115200 0 helper_uart_3000000.bin
Download FW image at specified BaudRate:
     ./fw_loader_arm /dev/ttyUSB# 3000000 1 firmware.image
 
