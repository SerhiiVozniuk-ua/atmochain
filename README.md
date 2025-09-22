# AtmoChain (ATMO)

---

## 🇬🇧 English

**AtmoChain (ATMO)** is a blockchain built on **Cosmos SDK** with a **Proof-of-Useful-Work (PoUW)** consensus.  
The mission is to use computational power for **real-world useful tasks**: climate modeling, biology, AI research.  

### 🌍 Mission
Atmo combines **blockchain** and **science**.  
Every block, transaction, and calculation not only secures the chain but also contributes to human progress.  

- Focus: climate and environmental data  
- Deflationary tokenomics: fixed supply + fee burning  
- Rewards: miners, stakers, DAO participants  
- Integrations: IPFS, DeFi, NFT incentives  

📖 See also [Whitepaper](./Atmo_Whitepaper_Investor_Miner.pdf)  

---

### ⚙️ Technical details
- Cosmos SDK `v0.53.3`
- Consensus: CometBFT (Tendermint Core)
- Base token: **atmo**
- Total supply: **100,000,000 ATMO (fixed)**

** Linux / macOS**
```bash
mkdir -p ~/.atmod/config
wget -O ~/.atmod/config/genesis.json https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/networks/genesis.json
# or:
curl -L https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/networks/genesis.json -o ~/.atmod/config/genesis.json

```
## Windows (PowerShell)
```bash

New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.atmod\config" | Out-Null
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/networks/genesis.json" -OutFile "$env:USERPROFILE\.atmod\config\genesis.json"

```
## Quick start with scripts

### Linux / macOS
```bash

curl -fsSL https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/scripts/join.sh | bash
```
### Windows (PowerShell)
```bash

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
iwr https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/scripts/join.ps1 -UseBasicParsing | iex
```

## 🚀 Build from source

### Linux (Ubuntu)
```bash
sudo apt update
sudo apt install -y golang-go make git jq

git clone git@github.com:SerhiiVozniuk-ua/atmochain.git
cd atmochain

go build -ldflags="-checklinkname=0" -o atmod ./cmd/atmod

./atmod start --minimum-gas-prices="0.00001atmo"

```
## Windows
### Install Go

Download Go from the official website: https://go.dev/dl/
.

Install it (default location: C:\Program Files\Go).

During installation, make sure "Add to PATH" is checked.
If not, add C:\Program Files\Go\bin manually to PATH.

### Build and Run
```bash

cd "C:\Users\Admin\OneDrive\Desktop\atmochain"
go build -ldflags="-checklinkname=0" -o atmod.exe ./cmd/atmod

# Initialize node home
.\atmod.exe init win-node --chain-id atmochain --home C:\atmo

# Copy genesis.json as described above into C:\atmo\config\genesis.json

# Start node
.\atmod.exe start --home C:\atmo --minimum-gas-prices="0.00001atmo"
```

## ⚖️ Run Validator

```bash
./atmod tx staking create-validator \
  --amount=50000000atmo \
  --from=alice \
  --pubkey=$(./atmod tendermint show-validator) \
  --chain-id=atmochain \
  --commission-rate=0.1 \
  --commission-max-rate=0.2 \
  --commission-max-change-rate=0.01 \
  --min-self-delegation=1

```


### 🗺 Roadmap

Q3 2025 — Whitepaper + PoUW prototype

Oct 2025 — Testnet launch (climate tasks)

Nov 2025 — Mainnet + ATMO token

Dec 2025 — IPFS integration, first clients, exchange listing

---


### ⚠️ Disclaimer

ATMO is a utility token, not a security.
Running nodes is your own responsibility.


---

# 🇺🇦 Українською

AtmoChain (ATMO) — це блокчейн на базі Cosmos SDK із консенсусом Proof-of-Useful-Work (PoUW).
Мета — використовувати обчислювальну потужність для корисних завдань у реальному житті: кліматичне моделювання, біологія, дослідження AI.

---


### 🌍 Місія

Atmo поєднує блокчейн і науку.
Кожен блок, транзакція і обчислення не лише підтримують мережу, а й служать розвитку людства.

Фокус: клімат та екологічні дані

Дефляційна токеноміка: фіксована емісія + спалювання комісій

Винагороди: майнери, стейкери, учасники DAO

Інтеграції: IPFS, DeFi, NFT-мотивація

---


### ⚙️ Технічні характеристики

Cosmos SDK v0.53.3

Консенсус: CometBFT (Tendermint Core)

Базовий токен: atmo

Загальна емісія: 100,000,000 ATMO (fixed)


---

### 🗺 Дорожня карта

Q3 2025 — Whitepaper + прототип PoUW

Жовтень 2025 — Testnet (кліматичні задачі)

Листопад 2025 — Mainnet + токен ATMO

Грудень 2025 — Інтеграція IPFS, перші клієнти, лістинг

---

### ⚠️ Дисклеймер

ATMO — це utility token, а не цінний папір.
Запуск вузлів здійснюється на ваш власний ризик.
