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