@echo off
chcp 65001 >nul
cd /d %~dp0
if not exist %~dp0node_modules (
    where node >nul 2>&1
    if errorlevel 1 (
        echo Node.js is not installed. Please install Node.js from https://nodejs.org/
        pause
        exit /b 1
    )
    echo Installing required packages...
    call npm install
    if errorlevel 1 (
        echo Installation failed.
        pause
        exit /b 1
    )
)
echo Building standalone portable LoahatAltahqeeq.exe...
call npm run dist
if errorlevel 1 (
    echo Build failed.
    pause
    exit /b 1
)
echo.
echo ============================================================
echo Build Complete!
echo Output folder: dist\
echo ============================================================
pause
