# Catálogo com pedidos por e-mail e painel de estoque

Tudo gratuito, sem programar. São 3 serviços: **Supabase** (itens, fotos e senha), **EmailJS** (envia o pedido para o seu e-mail) e uma **hospedagem estática** (Netlify, Cloudflare Pages ou GitHub Pages).

Arquivos:
- `index.html` – catálogo que o cliente vê (busca, pedido e envio)
- `admin.html` – painel com senha (estoque, cadastrar, editar e remover itens)
- `config.js` – onde você cola as chaves
- `setup.sql` – cria o banco e as regras de segurança
- `style.css` – visual

---

## 1. Supabase (itens, fotos e login) – supabase.com

1. Crie uma conta e um **New project** (guarde a senha do banco; você não vai precisar dela no dia a dia).
2. Menu **SQL Editor → New query**. Cole todo o conteúdo de `setup.sql` e clique em **Run**.
3. Menu **Authentication → Users → Add user → Create new user**. Coloque **seu e-mail e a senha do painel** e marque *Auto Confirm User*.
4. **IMPORTANTE:** em **Authentication → Sign In / Providers**, desligue **Allow new users to sign up**. Sem isso, qualquer pessoa poderia criar uma conta e editar seu estoque.
5. Em **Project Settings → API**, copie a **Project URL** e a chave **anon public** para o `config.js`.

## 2. EmailJS (pedido chega no seu e-mail) – emailjs.com

1. Crie uma conta gratuita.
2. **Email Services → Add New Service**: conecte seu Gmail/Outlook. Copie o **Service ID**.
3. **Email Templates → Create New Template**. Preencha assim:
   - **To email:** o e-mail que vai receber os pedidos
   - **Reply To:** `{{customer_email}}`
   - **Subject:** `Novo pedido de {{customer_name}}`
   - **Content:**
     ```
     Novo pedido recebido pelo catálogo

     Cliente: {{customer_name}}
     Telefone: {{customer_phone}}
     E-mail: {{customer_email}}

     Itens ({{total_units}} unidades):
     {{order_items}}

     Observações: {{notes}}
     ```
   Salve e copie o **Template ID**.
4. Em **Account → General**, copie a **Public Key**.
5. Cole os três valores no `config.js`.

## 3. Colocar no ar

Escolha uma opção (todas gratuitas):
- **Netlify:** em app.netlify.com/drop arraste a pasta `catalogo` inteira. Pronto.
- **Cloudflare Pages:** *Create project → Upload assets* e envie os arquivos.
- **GitHub Pages:** suba os arquivos num repositório e ative *Settings → Pages*.

O catálogo fica em `seusite.com/` e o painel em `seusite.com/admin.html`.

## 4. Usar

- Abra `/admin.html`, entre com o e-mail e a senha criados no passo 1.3.
- **Novo item:** nome, código, descrição, quantidade e foto.
- **Estoque:** use − / + ou digite o número; salva sozinho.
- **Remover:** apaga o item e a foto.
- Item com estoque 0 aparece como “Esgotado” e não pode ser pedido.

## Bom saber

- O estoque **não** baixa sozinho quando chega um pedido: você confirma o pedido e ajusta no painel. (Dá para automatizar depois, se quiser.)
- Limites gratuitos: EmailJS ≈ 200 e-mails/mês; Supabase ≈ 500 MB de banco e 1 GB de fotos (as fotos são reduzidas para ~900 px automaticamente).
- O Supabase gratuito **pausa o projeto após cerca de 1 semana sem acesso**. Se acontecer, entre no painel do Supabase e clique em *Restore*. Visitar o catálogo de vez em quando evita isso.
- Para trocar a senha: Supabase → Authentication → Users.
- Não há preços (como no seu modelo, que esconde preços até o login). Se quiser, posso adicionar preço ou área de clientes com senha.
