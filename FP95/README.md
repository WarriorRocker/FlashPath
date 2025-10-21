# FlashPath Windows 95 BootDisk
Boot a PC with no hard drive or CD-ROM to Windows 95 with only a floppy disk drive and FlashPath adapter.

## Theory of Operation
1. The PC is booted from an actual floppy disk imaged using [FP95.IMA](FP95/FP95.IMA) to DOS 7.1.

2. Drivers are loaded by [CONFIG.SYS](FP95/DISK/CONFIG.SYS):
   - [CD1.SYS](FP95/DISK/CD1.SYS) - Common CD-ROM drivers.
   - [FLASHDSK.SYS](FP95/DISK/FLASHDSK.SYS) - FlashPath adapter.
   - [HIMEM.SYS](FP95/DISK/HIMEM.SYS) - High memory support.
   - [IFSHLP.SYS](FP95/DISK/IFSHLP.SYS) - 32-Bit filesystems support.
   - [DRVSPACE.SYS](FP95/DISK/DRVSPACE.SYS) - DriveSpace support.

3. Disk contents copied to new RAM drive by [AUTOEXEC.BAT](FP95/DISK/AUTOEXEC.BAT):
   - [MSCDEX.EXE](FP95/DISK/MSCDEX.EXE) - Mounts any found CD-ROM drives.
   - [XMSDSK.EXE](FP95/DISK/XMSDSK.EXE) - Sets up RAM drive.

4. Using commands in [FP.BAT](FP95/DISK/FP.BAT) to:
   - `fp save` - Save compressed volume to the FlashPath adapter.
   - `fp load` - Load existing compressed volume from the FlashPath adapter.
   - `fp create ram` - Create a new compressed volume on RAM drive.
     - [DRVSPACE.EXE](FP95/DISK/DRVSPACE.EXE) - `/CREATE Z: /NEWDRIVE=X: /SIZE=30`
     - [ATTRIB.EXE](FP95/DISK/ATTRIB.EXE) `-S -H -R Z:\DRVSPACE.001`
   - `fp mount ram` - Mount existing compressed volume on RAM drive.
     - [DRVSPACE.EXE](FP95/DISK/DRVSPACE.EXE) - `/MOUNT=001 Z: /NEWDRIVE=X:`
     - [ATTRIB.EXE](FP95/DISK/ATTRIB.EXE) `-S -H -R Z:\DRVSPACE.001`
   - `fp setup cd` - Launch the Windows setup from CD-ROM.
     - [SUBST.EXE](FP95/DISK/SUBST.EXE) - `C: X:\`
     - `R:\SETUP.EXE /T:X:\TEMP /im /id /is`
   - `fp win` - Start Windows from compressed volume.
     - `PATH Z:\;X:\;X:\WINDOWS;X:\WINDOWS\COMMAND;X:\WINDOWS\SYSTEM`
     - [SETMDIR.EXE](FP95/DISK/SETMDIR.EXE) - `/r:X:\WINDOWS`
     - `X:\WINDOWS\WIN`

## Requirements
- PC with 386 processor or higher and at least 48MB of RAM.
- FlashPath adapter with 32MB Smart Media card.
- Boot Disk written with the [FP95.IMA](FP95/FP95.IMA) image.
- Installation media for [Windows 95 RTM](https://winworldpc.com/product/windows-95/rtm).

## Common Issues
- **Error SU991016 when Preparing Directory** - The setup was launched without using either `fp setup cd` or `fp setup disk`. The [FP.BAT](FP95/DISK/FP.BAT) script uses [SUBST.EXE](FP95/DISK/SUBST.EXE) to alias `C:` to the mounted DriveSpace volume `X:`.
- **Error SU992010 after Copying Files** - This is a good error, click `OK`.
- **Cannot find device file `C:\DRVSPACE.BIN` when starting windows** - Ignore this error by pressing any key.
- **Registry Error** - Windows was launched without using `fp win`. The [FP.BAT](FP95/DISK/FP.BAT) script uses [SETMDIR.EXE](FP95/DISK/SETMDIR.EXE) to set the Windows Registry location to `X:\WINDOWS`.
