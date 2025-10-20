@echo off

REM Configuration Variables
SET FPDRIVE=A
SET CDDRIVE=R
SET BOOTDRIVE=X
SET RAMDRIVE=Z
SET RAMSIZE=32768
SET WINDIR=WINDOWS
SET DRVSPACE=DRVSPACE
SET DRVFILE=DRVSPACE
SET DRVEXT=001
SET DRVSIZE=30

REM Set prompt and path
PROMPT $p$g
PATH %FPDRIVE%:\

echo Setting up CD-ROM
echo:
MSCDEX.EXE  /D:banana /L:%CDDRIVE%

REM Prepare RAM drive
echo:
echo Setting up RAM drive
XMSDSK %RAMSIZE% %RAMDRIVE%: /y

REM Copy disk to RAM drive
echo Copying minimal DOS files
PATH %FPDRIVE%:\;%RAMDRIVE%:\
copy /Y %FPDRIVE%:\*.* %RAMDRIVE%: > NUL

REM Update path
echo Running DOS from RAM drive
PATH %RAMDRIVE%:\
SET COMSPEC=%RAMDRIVE%:\COMMAND.COM

echo:
echo               FlashPath for Windows 95
echo             ----------------------------
echo                     @RobertsRetro
echo:
echo Install               Boot                Drives
echo $ fp create ram       $ fp load           %FPDRIVE%: FP Drive
echo $ fp setup cd         $ fp mount ram      %CDDRIVE%: CD-ROM
echo $ fp win              $ fp win            %BOOTDRIVE%: Boot Drive
echo $ fp save             $ fp save           %RAMDRIVE%: RAM Drive
echo:

REM Set drive
%RAMDRIVE%: > NUL
