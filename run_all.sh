#!/bin/bash

cleanup() {
    echo "Stopping Simulator..."
    kill $SIM_PID 2>/dev/null
}

trap cleanup EXIT INT

cd build

if [ ! -f ./weather_server ]; then
    echo "[ERROR] Build the project first!"
    exit 1
fi

echo "Starting Simulator..."
./sensor_simulator & 
SIM_PID=$!

sleep 2

echo "Starting Weather Server..."
./weather_server virtual_com
