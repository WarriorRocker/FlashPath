# FlashPath BootDisks
For MS-DOS 6.22, Windows 3.11, and Windows 95
  
Boot a PC with no hard drive or CD-ROM to various operating systems using only a floppy disk drive and FlashPath adapter.

## How it works
1. The PC is booted from an actual floppy disk to a compatible version of DOS for the targeted operating system. 
2. Drivers are loaded for the FlashPath adapter, Mouses, and CD-ROMs.
3. A set of minimal DOS files and other utilities are copied to a RAM drive.
4. Utilities are provided to load, save, or mount compressed files on the FlashPath adapter.

## Boot Disks
The PC must be booted using a compatible disk image for the targeted operating system.

### [Windows 95](FP95/README.md) - Stable
This release is stable and supports a repeatable environment for installing and booting Windows using the FlashPath adapter for persistent storage.
- Install Windows from floppy disks or CD-ROM.
- Boot Windows from a DriveSpace compressed volume mounted from a RAM drive.
- Save and load a DriveSpace compressed volume to/from the FlashPath adapter.

### [DOS 6.22](FP622/README.md) - Experimental
This release is experimental.

## References
- [Cathode Ray Dude](https://www.youtube.com/@CathodeRayDude) - https://www.youtube.com/watch?v=5g3afPmSnbY&t=2438s
- [Bits und Bolts](https://www.youtube.com/@bitsundbolts) - https://youtu.be/NGaNRgsNahM?t=350s
- [Tech Tangents](https://www.youtube.com/@techtangents) - https://www.youtube.com/watch?v=UxsRpMdmlGo
