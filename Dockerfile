# 明示的にEOLかつ脆弱なベースイメージ
FROM node:12-alpine

# root ユーザーのまま実行（Bad Practice）
USER root

# 脆弱な OS パッケージを固定インストール
RUN apk add --no-cache \
    bash \
    openssl=1.1.1k-r0 \
    curl

# アプリ配置
WORKDIR /app
COPY . /app

# 脆弱な npm パッケージをインストール
RUN npm install minimist@0.0.8 lodash@4.17.11

# 不要に広いポート公開
EXPOSE 3000

CMD ["node", "app.js"]
