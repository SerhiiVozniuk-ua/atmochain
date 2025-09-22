#!/usr/bin/env bash
set -euo pipefail

# ====== CONFIG ======
CHAIN_ID="atmochain"
HOME_DIR="${HOME}/.atmod"
BIN="./atmod"
RAW_BASE="https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/networks"
GENESIS_URL="$RAW_BASE/genesis.json"
PEERS_URL="$RAW_BASE/peers.txt"
SEEDS_URL="$RAW_BASE/seeds.txt"
MIN_GAS="0.00001atmo"
RPC_ADDR="127.0.0.1:26657"
# =====================

echo ">>> Creating home: $HOME_DIR"
mkdir -p "$HOME_DIR/config"

# 1) Init (если genesis ещё не скачан)
if [[ ! -f "$HOME_DIR/config/genesis.json" ]]; then
  $BIN init "$(hostname)-$(date +%s)" --chain-id "$CHAIN_ID" --home "$HOME_DIR"
fi

# 2) Скачиваем genesis.json
echo ">>> Downloading genesis.json"
curl -fsSL "$GENESIS_URL" -o "$HOME_DIR/config/genesis.json"

# 3) Скачиваем peers/seeds
PEERS=$(curl -fsSL "$PEERS_URL" | tr -d '\r\n')
SEEDS=$(curl -fsSL "$SEEDS_URL" | tr -d '\r\n')

CONFIG="$HOME_DIR/config/config.toml"

# 4) Прописываем peers/seeds в config.toml
sed -i.bak -E "s|^persistent_peers = \".*\"|persistent_peers = \"$PEERS\"|g" "$CONFIG"
sed -i.bak -E "s|^seeds = \".*\"|seeds = \"$SEEDS\"|g" "$CONFIG"

# 5) Запуск
echo ">>> Starting node..."
exec $BIN start --home "$HOME_DIR" --minimum-gas-prices="$MIN_GAS" --rpc.laddr "tcp://$RPC_ADDR"
