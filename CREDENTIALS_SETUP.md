# 🔑 Configuração de Credenciais para o Render

## 🚨 Problema Atual

O Rails está falhando durante `assets:precompile` porque não encontra o `secret_key_base` para produção.

## ✅ Solução: Configurar RAILS_MASTER_KEY no Render

### Passo 1: Acesse o Render
- Vá para [dashboard.render.com](https://dashboard.render.com)
- Selecione o serviço `ruby-on-rails-memory`

### Passo 2: Configure a Variável de Ambiente
- Clique em **"Environment"** no menu lateral
- Clique em **"Add Environment Variable"**
- Configure:

| Key | Value |
|-----|-------|
| `RAILS_MASTER_KEY` | `f309536ddd9f8f2955eac867086eb54d2841a74af714b4833cd4fcd0c1835362379e4114960ec42a241c9bd0d9e08e233d13c2071ef56bd43a49fe4ed16df2f3` |

### Passo 3: Salve e Re-deploy
- Clique em **"Save Changes"**
- Clique em **"Manual Deploy"** → **"Deploy latest commit"**

## 🔍 O que isso resolve

- ✅ **Rails terá acesso** ao `secret_key_base`
- ✅ **`assets:precompile` funcionará** corretamente
- ✅ **Aplicação rodará** em produção
- ✅ **Credenciais ficam seguras** (não no código)

## 📖 Como funciona

1. **RAILS_MASTER_KEY** é a chave para descriptografar as credenciais
2. **Rails usa essa chave** para acessar `config/credentials/production.yml.enc`
3. **`secret_key_base`** é lido das credenciais descriptografadas
4. **Aplicação funciona** normalmente em produção

---

**🎯 Após configurar, o deploy deve funcionar perfeitamente!**
