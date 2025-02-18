#!/bin/bash

# Verificar se o token do Discord está configurado
if [ ! -f .env ] || ! grep -q "DISCORD_TOKEN" .env; then
  echo "Erro: Token do Discord não encontrado no arquivo .env"
  echo "Por favor, configure o token no arquivo .env"
  exit 1
fi

# Compilar o TypeScript do bot usando tsconfig.bot.json
echo "Compilando TypeScript do bot..."
npx tsc -p tsconfig.bot.json

# Verificar se a compilação foi bem sucedida
if [ $? -eq 0 ]; then
  echo "Compilação bem sucedida. Iniciando o bot..."
  # Executar o bot
  node dist/src/index.js
else
  echo "Erro na compilação do TypeScript"
  exit 1
fi