# web-microservice

Go 語言開發的 Web 服務專案，使用 Docker 部署。

## 環境說明

- Go 1.24.0
- go-ethereum：以太坊鏈上互動（合約、錢包、交易）
- Solidity NFT ERC-721智能合約
- Sepolia 測試鏈（預設連線，可於 .env 設定 RPC）
- Postgres：儲存 NFT 與用戶資料
- RabbitMQ：發送登入通知信和寫入 log
- Redis：儲存 JWT 認證資料
- MongoDB：儲存 log 資料
- Mailhog：測試郵件服務
- Docker Compose 2.0

## 服務說明

### listen service
RabbitMQ 消息監聽服務，接收登入事件通知，發送通知信和寫入 log。

### log service
log記錄服務，將登入紀錄存入 MongoDB，方便查詢與追蹤。

### mail service
郵件發送服務，負責寄送系統通知信件，整合 Mailhog 測試郵件。

### nft service
NFT 業務主服務，提供 NFT 鑄造、查詢、交易等 API，整合以太坊智能合約與 Postgres 資料庫。

## 快速開始

### 1. 建立部署 .env 檔案

複製 development/.env.example 為 development/.env，並設定 Postgres、RabbitMQ、Redis 等密碼設定。

### 2. 建立 NFT 服務 .env 檔案

複製 nft-service/.env.example 為 nft-service/.env，並設定區塊鏈 RPC、JWT 等參數。
下載 NFT 後端專案 [nftweb-back](https://github.com/wkchen007/nftweb-back)，執行以下指令，編譯 docker 需要的執行檔：

```bash
make build_nft
```

### 3. 建立映像檔並啟動服務

切換到 development 目錄，執行以下指令，將所有微服務建置成 Docker 映像檔並啟動：

```bash
make up_build
```

### 4. API 服務預設監聽 8080 port

- http://localhost:8080

### 5. 啟動前端專案

前端專案 [nftweb-front](https://github.com/wkchen007/nftweb-front)，請參考說明。
- http://localhost:3000

### 6. 停止服務

切換到 development 目錄，執行以下指令，停止所有服務：

```bash
make down
```

## 相關專案

- 前端專案 [nftweb-front](https://github.com/wkchen007/nftweb-front)
- NFT Service 後端專案 [nftweb-back](https://github.com/wkchen007/nftweb-back)

## 授權

MIT License