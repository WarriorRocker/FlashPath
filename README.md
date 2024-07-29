# FlashPath Bootdisk
For MS-DOS 6.22, Windows 3.11, Windows 95  
  
Boot a PC with no hard drive or CD-ROM to Windows 95 or lower with only a floppy disk drive and FlashPath adapter.

## How it works
1. The PC is booted from an actual floppy disk to a compatible version of DOS for the targeted version of Windows. 
2. Drivers are loaded for the FlashPath adapter, Mouses, and CD-ROMs.
3. A set of minimal DOS files and other utilities are copied to a RAM drive that will be used to run the actual operating system.
4. The environment is switched to the RAM drive and you will then be prompted to insert the FlashPath adapter.
5. ZIP files on the FlashPath adapter will be expanded to the RAM drive and parts of the environment updated.
6. Lastly, run Windows by typing "win" at the command line.

## Boot Disks
There are two disk images provided, one for MS-DOS 6.22 and Windows 3.11, and the other for Windows 95. This is due to MS-DOS 6.22 being best for Windows 3.11 and Windows 95 will only start from DOS 7.0 or later. These images were created using WinImage 9.00 and the contents are provided in this repository for reference.

## Installing Windows
Using a PC with a floppy drive and hard drive, optionally a CD-ROM, install a slim version of Windows and obtain a ZIP file for booting entirely from the floppy drive.

**Requirements**
- A hard drive with a partition compatible with MS-DOS (no larger than 2GB) as Windows will not install to a RAM drive.
- Windows installation media, either copied to the hard drive or burned to a CD-ROM, such as [Windows 95 RTM](https://winworldpc.com/product/windows-95/rtm).
- FlashPath adapter with 16MB (32MB recommended) Smart Media card.
- Bootdisk image written to floppy disk.

**Installation**
1. Boot the PC using the Bootdisk choosing the install option.
   - The hard drive will be mapped to drive Z: and the CD-ROM mapped to drive R:.
   - Ensure the hard drive is accessible as Z:, "fdisk" and "format" may be necessary.
3. Choose to copy minimal files and run DOS from the Z: drive.
4. Type "winsetup" to launch the Windows setup from the CD-ROM, or start manually from the Z: drive.
   - Click OK to accept making changes to config.sys, no changes will actually be made.
   - Confirm the installation path as Z:\WINDOWS.
   - Choose Custom install and select a minimum amount of installed components.
   - Select No for creating a startup disk.
   - Finish and allow the PC to restart, do not remove the bootdisk.
5. Boot the PC using the Bootdisk again choosing the install option.
6. Choose again to copy minimal files and run DOS from the Z: drive.
7. Insert the FlashPath adapter and run "savezip" to create a ZIP file on the Smart Media card.
   - This process will take about 10 minutes or longer depending on the installation size.
8. Remove the hard drive if installed and Windows CD-ROM if inserted.
9. Insert the bootdisk, restart the PC and choose the run option.
10. Insert the FlashPath adapter when prompted and expand the ZIP file.
    - This process will take about 10 minutes or longer depending on the installation size.
11. Remove the FlashPath adapter and start Windows by running "win".
    - Complete the Windows first time setup, the floppy drive may be accessed repeatedly.
    - Do not click OK to restart, if you do start from step #9.
12. Press Ctrl+Shift+Escape to open the task manager.
13. Go to File -> Run Application -> explorer.exe -> Click OK
14. Go to Start -> Shutdown -> Restart in MS-DOS mode
15. Insert the FlashPath adapter and run "savezip" to create a ZIP file on the Smart Media card.
16. Type "exit" or "win" to start Windows.
17. Make any changes in Windows and repeat from step #14 to save changes to the ZIP.

## Common Problems
