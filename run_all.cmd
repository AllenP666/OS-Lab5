@echo off
cd build

if not exist sensor_simulator.exe (
    echo [ERROR] Build the project first!
    pause
    exit /b
)

echo Starting Simulator in a new window...
start "Sensor Simulator" sensor_simulator.exe

timeout /t 2 >nul

echo Starting Weather Server...
weather_server.exe virtual_com