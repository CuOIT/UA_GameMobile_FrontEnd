create table if not exists public.ua_user_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  progress jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.ua_user_progress enable row level security;

create policy "Users can read their own UA progress"
on public.ua_user_progress
for select
using (auth.uid() = user_id);

create policy "Users can insert their own UA progress"
on public.ua_user_progress
for insert
with check (auth.uid() = user_id);

create policy "Users can update their own UA progress"
on public.ua_user_progress
for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.ua_user_progress to authenticated;
create table if not exists public.ua_content_files (
  content_key text primary key,
  content_type text not null check (content_type in ('json', 'markdown')),
  json_content jsonb,
  text_content text,
  updated_at timestamptz not null default now(),
  check (
    (content_type = 'json' and json_content is not null and text_content is null)
    or (content_type = 'markdown' and text_content is not null and json_content is null)
  )
);

alter table public.ua_content_files enable row level security;

drop policy if exists "Anyone can read UA course content" on public.ua_content_files;
create policy "Anyone can read UA course content"
on public.ua_content_files
for select
using (true);

grant select on public.ua_content_files to anon, authenticated;