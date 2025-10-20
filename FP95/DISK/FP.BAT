@echo off

REM Check argument
if [%1]==[] GOTO help
GOTO %1

:create
if [%2]==[] GOTO help
GOTO create_%2

:create_fp
if exist %BOOTDRIVE%:\NUL goto error_is_mounted
if exist %FPDRIVE%:\%DRVFILE%.%DRVEXT% goto error_is_exist
echo Creating compressed drive on FP disk
%DRVSPACE% /CREATE %FPDRIVE%: /NEWDRIVE=%BOOTDRIVE%: /SIZE=%DRVSIZE%
ATTRIB -S -H -R %FPDRIVE%:\%DRVFILE%.%DRVEXT%
GOTO end

:create_ram
if exist %BOOTDRIVE%:\NUL goto error_is_mounted
if exist %RAMDRIVE%:\%DRVFILE%.%DRVEXT% goto error_is_exist
echo Creating compressed drive on RAM drive
%DRVSPACE% /CREATE %RAMDRIVE%: /NEWDRIVE=%BOOTDRIVE%: /SIZE=%DRVSIZE%
ATTRIB -S -H -R %RAMDRIVE%:\%DRVFILE%.%DRVEXT%
GOTO end

:mount
if [%2]==[] GOTO help
GOTO mount_%2

:mount_fp
if exist %BOOTDRIVE%:\NUL goto error_is_mounted
if not exist %FPDRIVE%:\%DRVFILE%.%DRVEXT% goto error_not_exist
echo Mounting compressed drive on FP disk
%DRVSPACE% /MOUNT=%DRVEXT% %FPDRIVE%: /NEWDRIVE=%BOOTDRIVE%:
ATTRIB -S -H -R %FPDRIVE%:\%DRVFILE%.%DRVEXT%
GOTO end

:mount_ram
if exist %BOOTDRIVE%:\NUL goto error_is_mounted
if not exist %RAMDRIVE%:\%DRVFILE%.%DRVEXT% goto error_not_exist
echo Mounting compressed drive on RAM drive
%DRVSPACE% /MOUNT=%DRVEXT% %RAMDRIVE% /NEWDRIVE=%BOOTDRIVE%:
ATTRIB -S -H -R %RAMDRIVE%:\%DRVFILE%.%DRVEXT%
GOTO end

:setup
if [%2]==[] GOTO help
GOTO setup_%2

:setup_cd
if not exist %BOOTDRIVE%:\NUL goto error_not_mounted
if not exist %CDDRIVE%:\setup.exe goto error_no_cd
echo Launching Windows setup from CD-ROM
if not exist C:\NUL SUBST C: %BOOTDRIVE%:\
if not exist %BOOTDRIVE%:\TEMP\NUL MKDIR %BOOTDRIVE%:\TEMP
%CDDRIVE%:\setup.exe /T:%BOOTDRIVE%:\TEMP /im /id /is
GOTO end

:setup_disk
if not exist %BOOTDRIVE%:\NUL goto error_not_mounted
if not exist %FPDRIVE%:\setup.exe goto error_no_cd
echo Launching Windows setup from Disk(s)
if not exist C:\NUL SUBST C: %BOOTDRIVE%:\
if not exist %BOOTDRIVE%:\TEMP\NUL MKDIR %BOOTDRIVE%:\TEMP
%FPDRIVE%:\setup.exe /T:%BOOTDRIVE%:\TEMP /im /id /is
GOTO end

:save
echo Saving compressed volume to FP disk
if not exist %RAMDRIVE%:\%DRVFILE%.%DRVEXT% goto error_not_exist
ATTRIB -S -H -R %RAMDRIVE%:\%DRVFILE%.%DRVEXT%
COPY %RAMDRIVE%:\%DRVFILE%.%DRVEXT% %FPDRIVE%:
GOTO end

:load
echo Loading compressed volume from FP disk
if not exist %FPDRIVE%:\%DRVFILE%.%DRVEXT% goto error_not_exist
ATTRIB -S -H -R %FPDRIVE%:\%DRVFILE%.%DRVEXT%
COPY %FPDRIVE%:\%DRVFILE%.%DRVEXT% %RAMDRIVE%:
GOTO end

:list
%DRVSPACE% /LIST
GOTO end

:unmount
%DRVSPACE% /UNMOUNT %BOOTDRIVE%:
GOTO end

:win
if not exist %BOOTDRIVE%:\NUL goto error_not_mounted
if not exist %BOOTDRIVE%:\%WINDIR%\NUL goto error_not_installed
PATH %RAMDRIVE%:\;%BOOTDRIVE%:\;%BOOTDRIVE%:\%WINDIR%
if exist %BOOTDRIVE%:\%WINDIR%\COMMAND\NUL PATH %PATH%;%BOOTDRIVE%:\%WINDIR%\COMMAND
if exist %BOOTDRIVE%:\%WINDIR%\SYSTEM\NUL PATH %PATH%;%BOOTDRIVE%:\%WINDIR%\SYSTEM
SETMDIR /r:%BOOTDRIVE%:\%WINDIR%
%BOOTDRIVE%:\%WINDIR%\WIN
PATH %RAMDRIVE%:\
GOTO end

:error_not_exist
echo Error! Compressed volume does not exist!
GOTO end

:error_is_exist
echo Error! Compressed volume already exists!
GOTO end

:error_not_mounted
echo Error! Compressed drive not mounted!
GOTO end

:error_is_mounted
echo Error! Compressed drive already mounted!
GOTO end

:error_not_installed
echo Error! Windows is not installed!
GOTO end

:error_no_cd
echo Error! CD ROM not ready or setup missing!
GOTO end

:help
echo FlashPath Helper Arguments - @RobertsRetro
echo:
echo  save          Save compressed volume to FP disk
echo  load          Load existing compressed volume from FP disk
echo  list          List drivespace mounted volumes
echo  unmount       Unmount compressed volume
echo  win           Start Windows from compressed volume
echo:
echo  create fp     Create a new compressed volume on FP disk
echo  create ram    Create a new compressed volume on RAM drive
echo:
echo  mount fp      Mount existing compressed volume on FP disk
echo  mount ram     Mount existing compressed volume on RAM drive
echo:
echo  setup cd      Launch Windows setup from CD-ROM
echo  setup disk    Launch Windows setup from Floppy Disk(s)
echo:

:end
