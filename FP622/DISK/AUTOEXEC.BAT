@echo off

call setvars.bat
PATH %FPDRIVE%\
PROMPT $p$g

:cdrom
REM Find the CD-ROM drive
mscdex /D:banana /L:R

:choiceram
choice /C:YN "Create and setup RAM disk? "
if errorlevel=2 goto end

:ramdrive
REM Prepare RAM drive
xmsdsk 49152 %RAMDRIVE% /y /t
REM xmsdsk 32768 %RAMDRIVE% /y

:copyutil
echo Copying utilities
mkdir %RAMDRIVE%\%UTLDIR%
copy /Y %FPDRIVE%\setvars.bat %RAMDRIVE%\%UTLDIR% > NUL
copy /Y %FPDRIVE%\flashdsk.bat %RAMDRIVE%\%UTLDIR% > NUL
copy /Y %FPDRIVE%\savezip.bat %RAMDRIVE%\%UTLDIR% > NUL
copy /Y %FPDRIVE%\pkzip.exe %RAMDRIVE%\%UTLDIR% > NUL
copy /Y %FPDRIVE%\pkunzip.exe %RAMDRIVE%\%UTLDIR% > NUL
PATH %PATH%;%RAMDRIVE%\%UTLDIR%

:copydos
echo Copying minimal DOS files
mkdir %RAMDRIVE%\%DOSDIR%
copy /Y %FPDRIVE%\command.com %RAMDRIVE%\%DOSDIR% > NUL
copy /Y %FPDRIVE%\choice.com %RAMDRIVE%\%DOSDIR% > NUL
PATH %PATH%;%RAMDRIVE%\%DOSDIR%

:startdos
echo Starting DOS from RAM drive
%RAMDRIVE%\%DOSDIR%\command.com %RAMDRIVE%\%DOSDIR% /k %RAMDRIVE%\%UTLDIR%\flashdsk.bat
:end
