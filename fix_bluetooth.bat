@echo off
title - https://github.com/OtaconEvil

REM -- Configuración y verificación de permisos de administrador --
echo Habilitar servicios de Bluetooth
echo.

REM Comprobar si el script se está ejecutando con permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script debe ser ejecutado con permisos de administrador.
    pause
    exit /b 1
)

REM -- Habilitar los servicios de Bluetooth --
REM Habilitar el servicio de Soporte de Bluetooth (bthserv)
sc config bthserv start=auto

REM Habilitar el servicio de control remoto de audio de Bluetooth (btaudiosvc)
sc config btaudiosvc start=auto

REM Habilitar el servicio de manos libres de Bluetooth (bthhfhid)
sc config bthhfhid start=auto

REM Habilitar el servicio del dispositivo Bluetooth (BthHFSrv)
sc config BthHFSrv start=auto

REM -- Iniciar los servicios de Bluetooth --
REM Iniciar el servicio de Soporte de Bluetooth (bthserv)
net start bthserv

REM Iniciar el servicio de control remoto de audio de Bluetooth (btaudiosvc)
net start btaudiosvc

REM Iniciar el servicio de manos libres de Bluetooth (bthhfhid)
net start bthhfhid

REM Iniciar el servicio del dispositivo Bluetooth (BthHFSrv)
net start BthHFSrv

REM -- Verificar si los servicios se iniciaron correctamente --
sc query bthserv | find "RUNNING" >nul 2>&1
if %errorLevel% equ 0 (
    echo El servicio de Soporte de Bluetooth (bthserv) ha sido habilitado y comenzado correctamente.
) else (
    echo No se pudo habilitar o comenzar el servicio de Soporte de Bluetooth (bthserv).
)

sc query btaudiosvc | find "RUNNING" >nul 2>&1
if %errorLevel% equ 0 (
    echo El servicio de control remoto de audio de Bluetooth (btaudiosvc) ha sido habilitado y comenzado correctamente.
) else (
    echo No se pudo habilitar o comenzar el servicio de control remoto de audio de Bluetooth (btaudiosvc).
)

sc query bthhfhid | find "RUNNING" >nul 2>&1
if %errorLevel% equ 0 (
    echo El servicio de manos libres de Bluetooth (bthhfhid) ha sido habilitado y comenzado correctamente.
) else (
    echo No se pudo habilitar o comenzar el servicio de manos libres de Bluetooth (bthhfhid).
)

sc query BthHFSrv | find "RUNNING" >nul 2>&1
if %errorLevel% equ 0 (
    echo El servicio del dispositivo Bluetooth (BthHFSrv) ha sido habilitado y comenzado correctamente.
) else (
    echo No se pudo habilitar o comenzar el servicio del dispositivo Bluetooth (BthHFSrv).
)

pause
