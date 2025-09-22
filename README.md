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

---
!!! genesis.json 
```bash
wget https://raw.githubusercontent.com/<org>/<repo>/main/networks/genesis.json -O ~/.atmo/config/genesis.json

```
### 🚀 Installation & Run

#### Linux (Ubuntu)
```bash
sudo apt update
sudo apt install -y golang-go make git jq

git clone git@github.com:SerhiiVozniuk-ua/atmochain.git
cd atmochain

go build -ldflags="-checklinkname=0" -o atmod ./cmd/atmod

./atmod init mynode --chain-id atmochain

jq '.app_state.staking.params.bond_denom="atmo"
  | .app_state.mint.params.mint_denom="atmo"
  | .app_state.gov.params.min_deposit[0].denom="atmo"
  | .app_state.gov.params.expedited_min_deposit[0].denom="atmo"' \
  ~/.atmo/config/genesis.json > /tmp/genesis.fixed && mv /tmp/genesis.fixed ~/.atmo/config/genesis.json

./atmod keys add alice
./atmod keys add bob

./atmod genesis add-genesis-account alice 100000000atmo
./atmod genesis add-genesis-account bob   100000000atmo

./atmod genesis gentx alice 50000000atmo --chain-id atmochain

./atmod genesis collect-gentxs
./atmod genesis validate-genesis

./atmod start --minimum-gas-prices="0.00001atmo"
```

---

#### Windows
```bash

####  Install Go
1. Download Go from the official website: [https://go.dev/dl/](https://go.dev/dl/).
2. Install it (default location: `C:\Program Files\Go`).
3. During installation, make sure **"Add to PATH"** is checked.  


cd "C:\Users\Admin\OneDrive\Desktop\atmochain"
go build -ldflags="-checklinkname=0" -o atmod.exe ./cmd/atmod


.\atmod.exe start --minimum-gas-prices="0.00001atmo"
```
---


#### Run Validator
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
---


###🗺 Roadmap

Q3 2025 — Whitepaper + PoUW prototype

Oct 2025 — Testnet launch (climate tasks)

Nov 2025 — Mainnet + ATMO token

Dec 2025 — IPFS integration, first clients, exchange listing

---


###⚠️ Disclaimer

ATMO is a utility token, not a security.
Running nodes is your own responsibility.


---

🇺🇦 Українською

AtmoChain (ATMO) — це блокчейн на базі Cosmos SDK із консенсусом Proof-of-Useful-Work (PoUW).
Мета — використовувати обчислювальну потужність для корисних завдань у реальному житті: кліматичне моделювання, біологія, дослідження AI.

---


###🌍 Місія

Atmo поєднує блокчейн і науку.
Кожен блок, транзакція і обчислення не лише підтримують мережу, а й служать розвитку людства.

Фокус: клімат та екологічні дані

Дефляційна токеноміка: фіксована емісія + спалювання комісій

Винагороди: майнери, стейкери, учасники DAO

Інтеграції: IPFS, DeFi, NFT-мотивація

---


###⚙️ Технічні характеристики

Cosmos SDK v0.53.3

Консенсус: CometBFT (Tendermint Core)

Базовий токен: atmo

Загальна емісія: 100,000,000 ATMO (fixed)


---

###🗺 Дорожня карта

Q3 2025 — Whitepaper + прототип PoUW

Жовтень 2025 — Testnet (кліматичні задачі)

Листопад 2025 — Mainnet + токен ATMO

Грудень 2025 — Інтеграція IPFS, перші клієнти, лістинг

---

###⚠️ Дисклеймер

ATMO — це utility token, а не цінний папір.
Запуск вузлів здійснюється на ваш власний ризик.
