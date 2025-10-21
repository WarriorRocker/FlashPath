@echo off

call setvars.bat
PATH %RAMDRIVE%\;%RAMDRIVE%\%UTLDIR%;%RAMDRIVE%\%DOSDIR%
PROMPT $p$g
%RAMDRIVE%

:expand
choice /C:YN "Expand ZIP files on FlashPath disk? "
if errorlevel=2 goto end

:insert
echo Insert FlashPath disk and press any key
pause > NUL

:choiceutl
if not exist %FPDRIVE%\%UTLZIP% goto choicedos
choice /C:YN "Expand %FPDRIVE%\%UTLZIP%? "
if errorlevel=2 goto choicedos

:expandutl
echo Expanding %FPDRIVE%\%UTLZIP% to %RAMDRIVE%\UTLDIR%
if not exist %RAMDRIVE%\%UTLDIR%\NUL mkdir %RAMDRIVE%\%UTLDIR% > NUL
pkunzip -o -d %FPDRIVE%\%UTLZIP% %RAMDRIVE%\%UTLDIR% > NUL

:choicedos
if not exist %FPDRIVE%\%DOSZIP% goto choicewin
choice /C:YN "Expand %FPDRIVE%\%DOSZIP%? "
if errorlevel=2 goto choicewin

:expanddos
echo Expanding %FPDRIVE%\%DOSZIP% to %RAMDRIVE%\%DOSDIR%
if not exist %RAMDRIVE%\%DOSDIR%\NUL mkdir %RAMDRIVE%\%DOSDIR% > NUL
pkunzip -o -d %FPDRIVE%\%DOSZIP% %RAMDRIVE%\%DOSDIR% > NUL

:choicewin
if not exist %FPDRIVE%\%WINZIP% goto end
choice /C:YN "Expand %FPDRIVE%\%WINZIP%? "
if errorlevel=2 goto end

:expandwin
echo Expanding %FPDRIVE%\%WINZIP% to %RAMDRIVE%\%WINDIR%
if not exist %RAMDRIVE%\%WINDIR%\NUL mkdir %RAMDRIVE%\%WINDIR% > NUL
pkunzip -o -d %FPDRIVE%\%WINZIP% %RAMDRIVE%\%WINDIR% > NUL
PATH %PATH%;%RAMDRIVE%\%WINDIR%

:end