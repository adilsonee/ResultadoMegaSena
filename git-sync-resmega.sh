#!/bin/bash

echo "--------------------------------------------------"
echo "📤 ATUALIZANDO REPOSITÓRIO GITHUB"
echo "--------------------------------------------------"

# 1. Verifica se há algo alterado (status --porcelain retorna vazio se estiver limpo)
if [ -z "$(git status --porcelain)" ]; then
    echo "✨ Nada para atualizar! O repositório já está em dia."
    echo "--------------------------------------------------"
    exit 0
fi

# 2. Se chegou aqui, há alterações. Adiciona tudo:
git add .

# 3. Pede a mensagem
echo "📝 Digite a descrição das alterações:"
read mensagem

if [ -z "$mensagem" ]; then
    mensagem="Atualização automática: $(date +'%d/%m/%Y %H:%M')"
fi

# 4. Commit e Push com verificação de erro
git commit -m "$mensagem"

echo "🚀 Enviando para o GitHub..."
if git push origin main; then
    echo "--------------------------------------------------"
    echo "✅ GITHUB ATUALIZADO COM SUCESSO!"
    echo "--------------------------------------------------"
else
    echo "--------------------------------------------------"
    echo "❌ OPS! OCORREU UM ERRO NO PUSH."
    echo "--------------------------------------------------"
    exit 1
fi
