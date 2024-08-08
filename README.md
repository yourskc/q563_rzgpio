# q563_rzgpio

Purpose : A Qt Quick Project demos how to connect to PMOD buttons and leds for Renesas RZ/G2L.

## 1. Prerequisites

Prepare a Renesas RZ/G2L board running a pre-build BSP image or yocto build image by using 'core-image-qt' . We will transfer and execute our code on it later.

Also prepare a Qt5.6.3 and Qt Creator with cross compiler environment on the Ubuntu 22.04. 

For the above please follow the steps in this repo, 

URL

Prepare a PMOD button board and a PMOD leds board for the test.

Connect the PMOD boards as below.

Pic

## 2. Build 

In the Qt Creator, open and browse to the project file "q563_rzgpio.pro", 
Ctrl-B to build with RZG2L kits
settings. 
The result executable file q563_rzgpio should be at the build-q563_rzgpio-xxx folder.   

You can also build this project with desktop kits settings first, and run it on your desktop for a check( only the UI part). Howerer, the GPIO functions still need to be run on the RZ/G2L board anyway. 

## 3. Run

Copy the executable file to RZ/G2L using scp command, for example 
( replace with your ip and username )

on the RZ/G2L
> scp skc@192.168.0.105:/home/skc/reneses_test/q563_rzgpio .

or, on the host
> scp q563_rzgpio root@192.168.0.216:/home/root




















