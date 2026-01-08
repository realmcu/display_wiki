#!/usr/bin/env bash
set -euo pipefail

# Simple static server for WSL
# Usage: ./serve.sh [-p PORT] [-d DIR]

PORT="${PORT:-8000}"
DIR="${DIR:-site}"

usage() {
  cat <<EOF
Usage: $0 [-p PORT] [-d DIR]

Options:
  -p, --port   Port to listen on (default: $PORT)
  -d, --dir    Directory to serve (default: $DIR)
  -h, --help   Show this help

Examples:
  $0                      # serve ./site on port 8000
  $0 -p 9000             # serve on port 9000
  DIR=site $0 --port 8000

Notes (WSL):
  - Windows (same PC) can open http://localhost:PORT
  - For LAN access via Windows host: open PowerShell (Admin) and run:
      netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=PORT connectaddress=<WSL-IP> connectport=PORT
      netsh advfirewall firewall add rule name="WSL Docs PORT" dir=in action=allow protocol=TCP localport=PORT
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--port)
      PORT="${2:-}"
      shift 2
      ;;
    -d|--dir)
      DIR="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

mkdir -p "$DIR"

# Try to discover WSL IP for hints
WSL_IP="$(hostname -I 2>/dev/null | awk '{print $1}')"

echo "Serving '$DIR' on 0.0.0.0:$PORT"
echo "- Windows (same machine): http://localhost:$PORT"
if [[ -n "$WSL_IP" ]]; then
  echo "- WSL IP (for portproxy connectaddress): $WSL_IP"
fi
echo "- Stop server: Ctrl+C"

cd "$DIR"
exec python3 -m http.server "$PORT" --bind 0.0.0.0

