# FlashPath Windows 95 Bootdisk
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
   - `fp create ram` - Create a new compressed volume on RAM drive
   - `fp mount ram` - Mount existing compressed volume on RAM drive.
   - `fp setup cd` - Launch the Windows setup from CD-ROM.
   - `fp win` - Start Windows from compressed volume.

## Requirements
- FlashPath adapter with 32MB Smart Media card.
- Boot Disk written with the [FP95.IMA](FP95/FP95.IMA) image.
- Installation media for [Windows 95 RTM](https://winworldpc.com/product/windows-95/rtm).

## References
- [Cathode Ray Dude](https://www.youtube.com/@CathodeRayDude) - https://www.youtube.com/watch?v=5g3afPmSnbY&t=2438s
- [Bits und Bolts](https://www.youtube.com/@bitsundbolts) - https://youtu.be/NGaNRgsNahM?t=350s
- [Tech Tangents](https://www.youtube.com/@techtangents) - https://www.youtube.com/watch?v=UxsRpMdmlGo
