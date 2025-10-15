@echo off
setlocal

if "%~1"=="" (
  echo Usage: save.bat "message du commit"
  exit /b 1
)

set "msg=%~1"
shift
:collect
if "%~1"=="" goto run
set "msg=%msg% %~1"
shift
goto collect

:run
git add .
git commit -m "%msg%"
if errorlevel 1 goto end
git push origin main

:end
endlocal
