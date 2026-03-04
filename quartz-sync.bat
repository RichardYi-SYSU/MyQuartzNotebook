@echo off
setlocal

cd /d "%~dp0"

where npx >nul 2>nul
if errorlevel 1 (
  echo [Error] npx not found. Please install Node.js first.
  pause
  exit /b 1
)

echo Running: npx quartz sync
call npx quartz sync %*
if errorlevel 1 (
  echo [Error] Sync failed.
  pause
  exit /b 1
)

echo Sync completed.
pause
