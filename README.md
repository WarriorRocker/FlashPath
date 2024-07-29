# FlashPath Bootdisk
For MS-DOS 6.22, Windows 3.11, Windows 95  
  
Boot a PC with no hard drive or cd-rom to Windows 95 or lower with only a floppy disk drive and FlashPath adapter.

## How it works
1. The PC is booted from an actual floppy disk to a compatible version of DOS for the targeted version of Windows. 
2. Drivers are loaded for the FlashPath adapter, Mouses, and CD-ROMs.
3. A set of minimal DOS files and other utilities are copied to a RAM drive that will be used to run the actual operating system.
4. The environment is switched to the RAM drive and you will then be prompted to insert the FlashPath adapter.
5. ZIP files on the FlashPath adapter will be expanded to the RAM drive and parts of the environment updated.
6. Lastly, run Windows by typing "win" at the command line.

## Boot Disks
There are two disk images provided, one for MS-DOS 6.22 and Windows 3.11, and the other for Windows 95. This is due to MS-DOS 6.22 being best for Windows 3.11 and Windows 95 will only start from DOS 7.0 or later. These images were created using WinImage 9.00 and the contents are provided in this repository for reference.

## Installation

## Common Problems
