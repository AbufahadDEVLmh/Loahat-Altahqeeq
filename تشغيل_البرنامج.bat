@echo off
chcp 65001 >nul
cd /d %~dp0
if not exist %~dp0node_modules\electron\dist\electron.exe (
    where node >nul 2>&1
    if errorlevel 1 (
        echo Node.js is not installed. Please install Node.js from https://nodejs.org/
        pause
        exit /b 1
    )
    echo First run detected - installing required packages...
    call npm install
    if errorlevel 1 (
        echo Installation failed.
        pause
        exit /b 1
    )
)
start " %~dp0node_modules\electron\dist\electron.exe %~dp0.
