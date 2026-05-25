#!/bin/bash
# Run on a fresh Ubuntu 22.04 VM (Oracle Cloud Always Free, Google e2-micro, etc.)
set -euo pipefail

REPO_URL="${REPO_URL:-https://github.com/cdandeniya/stock-trader.git}"
APP_DIR="${APP_DIR:-$HOME/stock-trader}"

echo "==> Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose-v2 git
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER" || true

echo "==> Cloning app..."
if [ ! -d "$APP_DIR/.git" ]; then
  git clone "$REPO_URL" "$APP_DIR"
fi
cd "$APP_DIR/stock-trader"

if [ ! -f .env ]; then
  cp .env.example .env
  echo "Edit $APP_DIR/stock-trader/.env with strong passwords, then run:"
  echo "  cd $APP_DIR/stock-trader && docker compose up -d --build"
  exit 0
fi

echo "==> Starting NovaTrade..."
docker compose up -d --build

PUBLIC_IP=$(curl -s ifconfig.me || hostname -I | awk '{print $1}')
echo ""
echo "NovaTrade should be available at: http://${PUBLIC_IP}/"
echo "Demo login: test@test.com / admin"
