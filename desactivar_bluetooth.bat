@echo off
setlocal
title - https://github.com/OtaconEvil

REM Comprobar si el script se está ejecutando con permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script debe ser ejecutado con permisos de administrador.
    pause
    exit /b 1
)

REM Apagar el Bluetooth
echo Apagando el Bluetooth...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Bluetooth\Radio\0" /v "Enable" /t REG_DWORD /d 0 /f >nul

REM Mostrar el estado actual del Bluetooth
echo Estado actual del Bluetooth:
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Bluetooth\Radio\0" /v "Enable" | find "REG_DWORD"
echo.

pause
