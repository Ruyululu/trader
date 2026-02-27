@echo off
setlocal

chcp 936 >nul

set "VCVARS=D:\Program Files\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS%" (
    echo [ERROR] vcvars64.bat not found: %VCVARS%
    exit /b 1
)

call "%VCVARS%"
if errorlevel 1 (
    echo [ERROR] Failed to initialize Visual Studio build environment.
    exit /b 1
)

cd /d "%~dp0"
cls

cmake --preset win
if errorlevel 1 exit /b 1

cmake --build --preset win
if errorlevel 1 exit /b 1

echo [OK] Build finished.
exit /b 0
