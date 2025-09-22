#Requires -Version 5
$ErrorActionPreference = "Stop"

# ====== CONFIG ======
$ChainId   = "atmochain"
$HomeDir   = "$env:USERPROFILE\.atmod"
$Bin       = ".\atmod.exe"
$RawBase   = "https://raw.githubusercontent.com/SerhiiVozniuk-ua/atmochain/main/networks"
$GenesisUrl= "$RawBase/genesis.json"
$PeersUrl  = "$RawBase/peers.txt"
$SeedsUrl  = "$RawBase/seeds.txt"
$MinGas    = "0.00001atmo"
$RpcAddr   = "127.0.0.1:26657"
# =====================

Write-Host ">>> Creating home: $HomeDir"
New-Item -ItemType Directory -Force -Path (Join-Path $HomeDir "config") | Out-Null

# 1) Init (если genesis ещё не скачан)
if (-not (Test-Path (Join-Path $HomeDir "config\genesis.json"))) {
  & $Bin init "win-$(Get-Date -Format yyyyMMddHHmmss)" --chain-id $ChainId --home $HomeDir
}

# 2) Скачиваем genesis.json
Write-Host ">>> Downloading genesis.json"
Invoke-WebRequest -Uri $GenesisUrl -OutFile (Join-Path $HomeDir "config\genesis.json")

# 3) Скачиваем peers/seeds
function Get-RemoteLine($url) {
  try {
    $c = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content
    return ($c -replace "`r","" -replace "`n","")
  } catch {
    return ""
  }
}

$peers = Get-RemoteLine $PeersUrl
$seeds = Get-RemoteLine $SeedsUrl

# 4) Прописываем peers/seeds в config.toml
$Config = Join-Path $HomeDir "config\config.toml"
$content = Get-Content $Config -Raw
$content = $content -replace 'persistent_peers\s*=\s*".*"', "persistent_peers = `"$peers`""
$content = $content -replace 'seeds\s*=\s*".*"', "seeds = `"$seeds`""
Set-Content -Path $Config -Value $content -Encoding UTF8

# 5) Запуск
Write-Host ">>> Starting node..."
& $Bin start --home $HomeDir --minimum-gas-prices $MinGas --rpc.laddr "tcp://$RpcAddr"
