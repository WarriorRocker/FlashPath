@echo off

:choiceutl
if not exist %RAMDRIVE%\%UTLDIR%\NUL goto choicedos
choice /C:YN "Create/overwrite %FPDRIVE%\%UTLZIP%? "
if errorlevel=2 goto choicedos

:saveutl
echo Creating %FPDRIVE%\%UTLZIP%
if exist %FPDRIVE%\%UTLZIP% del %FPDRIVE%\%UTLZIP% > NUL
pkzip -r %FPDRIVE%\%UTLZIP% %RAMDRIVE%\%UTLDIR%\*.* > NUL

:choicedos
if not exist %RAMDRIVE%\%DOSDIR%\NUL goto choicewin
choice /C:YN "Create/overwrite %FPDRIVE%\%DOSZIP%? "
if errorlevel=2 goto choicewin

:savedos
echo Creating %FPDRIVE%\%DOSZIP%
if exist %FPDRIVE%\%DOSZIP% del %FPDRIVE%\%DOSZIP% > NUL
pkzip -r %FPDRIVE%\%DOSZIP% %RAMDRIVE%\%DOSDIR%\*.* > NUL

:choicewin
if not exist %RAMDRIVE%\%WINDIR%\NUL goto end
choice /C:YN "Create/overwrite %FPDRIVE%\%WINZIP%? "
if errorlevel=2 goto end

:savewin
echo Creating %FPDRIVE%\%WINZIP%
if exist %FPDRIVE%\%WINZIP% del %FPDRIVE%\%WINZIP% > NUL
pkzip -r %FPDRIVE%\%WINZIP% %RAMDRIVE%\%WINDIR%\*.* > NUL

:end