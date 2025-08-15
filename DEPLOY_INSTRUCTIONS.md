# 🚀 Instruções para Deploy no Render

## 📋 Pré-requisitos

- ✅ Projeto já está no GitHub: `eduardowanderleyde/ruby-on-rails-memory`
- ✅ Configuração do Render já está no `render.yaml`

## 🔑 Configuração das Credenciais

### 1. Chave Master (RAILS_MASTER_KEY)

Use esta chave como valor da variável de ambiente `RAILS_MASTER_KEY` no Render:

```
c26f031abb0344e67dc41905785356813954142666c47f5b1280cc7a65dd27c98faa6b0ec4d1ce463c321a6e09819f09ab2fcbef6b4168a330b861d3c433798a
```

## 🎯 Passos para Deploy

### 1. Acesse o Render
- Vá para [render.com](https://render.com)
- Faça login na sua conta

### 2. Crie um Novo Web Service
- Clique em **"New +"**
- Selecione **"Web Service"**

### 3. Conecte o Repositório
- Selecione **"Connect a repository"**
- Escolha **GitHub**
- Selecione o repositório: `eduardowanderleyde/ruby-on-rails-memory`
- Clique em **"Connect"**

### 4. Configure o Serviço
O Render detectará automaticamente o `render.yaml`, mas você pode ajustar:

- **Name**: `memory-game` (ou o nome que preferir)
- **Environment**: `Ruby`
- **Region**: Escolha a mais próxima
- **Branch**: `main`
- **Build Command**: `./build.sh`
- **Start Command**: `bundle exec puma -C config/puma.rb`

### 5. Configure as Variáveis de Ambiente
Adicione estas variáveis:

| Key | Value |
|-----|-------|
| `RAILS_ENV` | `production` |
| `RAILS_MASTER_KEY` | `c26f031abb0344e67dc41905785356813954142666c47f5b1280cc7a65dd27c98faa6b0ec4d1ce463c321a6e09819f09ab2fcbef6b4168a330b861d3c433798a` |
| `RAILS_SERVE_STATIC_FILES` | `true` |
| `RAILS_LOG_TO_STDOUT` | `true` |

### 6. Deploy
- Clique em **"Create Web Service"**
- O Render começará o build automaticamente
- Aguarde o deploy completar

## 🔍 Verificação do Deploy

Após o deploy:
1. Acesse a URL fornecida pelo Render
2. Você deve ver o jogo da memória funcionando
3. Verifique os logs se houver problemas

## 🛠️ Troubleshooting

### Se o build falhar:
- Verifique os logs do build
- Confirme se a `RAILS_MASTER_KEY` está correta
- Verifique se todas as variáveis de ambiente estão configuradas

### Se a aplicação não carregar:
- Verifique os logs da aplicação
- Confirme se o banco de dados está configurado (se necessário)

## 📱 Acesso

Após o deploy bem-sucedido, você terá uma URL como:
`https://memory-game.onrender.com`

## 🔄 Deploy Automático

- O Render fará deploy automático sempre que você fizer push para a branch `main`
- Não é necessário fazer nada manualmente após a configuração inicial

---

**🎉 Parabéns! Seu jogo da memória estará rodando na nuvem!**
