# 🗄️ Configuração do Banco de Dados no Render

## 🚨 Problema Atual

O Rails está rodando, mas não consegue se conectar ao PostgreSQL:
```
PG::ConnectionBad: connection to server at "<HOST>" failed: Connection refused
```

## ✅ Solução: Criar e Configurar PostgreSQL no Render

### Passo 1: Criar Banco PostgreSQL no Render

1. **Acesse o Render:**
   - Vá para [dashboard.render.com](https://dashboard.render.com)
   - Clique em **"New +"** → **"PostgreSQL"**

2. **Configure o Banco:**
   - **Name:** `memory-game-db` (ou qualquer nome)
   - **Database:** `memory_game_production`
   - **User:** deixe o padrão
   - **Region:** mesma do seu serviço Rails
   - **Plan:** `Free` (para começar)

3. **Clique em "Create Database"**

### Passo 2: Copiar DATABASE_URL

Após criar o banco:
1. Clique no banco criado
2. Na aba **"Connections"**
3. Copie a **"External Database URL"** (algo como):
   ```
   postgres://user:password@host:5432/database
   ```

### Passo 3: Configurar no Serviço Rails

1. **Vá para o serviço Rails:**
   - Clique no serviço `ruby-on-rails-memory`

2. **Adicione a Variável de Ambiente:**
   - Clique em **"Environment"**
   - Clique em **"Add Environment Variable"**
   - Configure:

| Key | Value |
|-----|-------|
| `DATABASE_URL` | `postgres://user:password@host:5432/database` (sua URL real) |

3. **Salve as mudanças**

### Passo 4: Re-deploy

1. Clique em **"Manual Deploy"** → **"Deploy latest commit"**

## 🔍 O que isso resolve

- ✅ **Rails terá conexão** com o banco PostgreSQL
- ✅ **Aplicação funcionará** completamente
- ✅ **Memory Game** estará online e funcional

## 📖 Como funciona

1. **PostgreSQL** roda como serviço separado no Render
2. **DATABASE_URL** conecta o Rails ao banco
3. **Rails** pode ler/escrever dados normalmente
4. **Aplicação** funciona em produção

---

**🎯 Após configurar o banco, o deploy deve funcionar perfeitamente!**

## 🚀 Próximos passos

Depois que o deploy funcionar:
1. **Verificar logs** para confirmar conexão
2. **Testar a aplicação** no navegador
3. **Jogar o Memory Game** online! 🎮
