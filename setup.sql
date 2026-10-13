-- Cole tudo isto no Supabase: SQL Editor > New query > Run

-- 1) Tabela de produtos
create table if not exists public.products (
  id          uuid primary key default gen_random_uuid(),
  code        text not null unique,
  name        text not null,
  description text not null default '',
  image_url   text,
  image_path  text,
  stock       integer not null default 0 check (stock >= 0),
  created_at  timestamptz not null default now()
);

-- 2) Segurança: qualquer pessoa LÊ; só quem está logado (você) ALTERA
alter table public.products enable row level security;

drop policy if exists "leitura publica" on public.products;
create policy "leitura publica" on public.products
  for select using (true);

drop policy if exists "admin altera" on public.products;
create policy "admin altera" on public.products
  for all to authenticated using (true) with check (true);

-- 3) Pasta pública para as fotos
insert into storage.buckets (id, name, public)
values ('produtos', 'produtos', true)
on conflict (id) do nothing;

drop policy if exists "fotos publicas" on storage.objects;
create policy "fotos publicas" on storage.objects
  for select using (bucket_id = 'produtos');

drop policy if exists "admin envia fotos" on storage.objects;
create policy "admin envia fotos" on storage.objects
  for insert to authenticated with check (bucket_id = 'produtos');

drop policy if exists "admin altera fotos" on storage.objects;
create policy "admin altera fotos" on storage.objects
  for update to authenticated using (bucket_id = 'produtos');

drop policy if exists "admin apaga fotos" on storage.objects;
create policy "admin apaga fotos" on storage.objects
  for delete to authenticated using (bucket_id = 'produtos');
