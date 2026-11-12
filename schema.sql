create extension if not exists pgcrypto;

create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  client_id text not null,
  title text not null,
  project text not null default 'Personal',
  priority text not null default 'medium' check (priority in ('low', 'medium', 'high')),
  due_date date,
  due_time time,
  repeat_schedule text not null default 'none' check (repeat_schedule in ('none', 'daily', 'weekly')),
  is_complete boolean not null default false,
  created_at timestamptz not null default now()
);

alter table public.tasks add column if not exists client_id text;
update public.tasks set client_id = id::text where client_id is null;
alter table public.tasks alter column client_id set not null;
create unique index if not exists tasks_user_client_id_key on public.tasks (user_id, client_id);
alter table public.tasks enable row level security;
drop policy if exists "Users manage their own tasks" on public.tasks;
create policy "Users manage their own tasks" on public.tasks for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  plan text not null default 'Free' check (plan in ('Free', 'Pro', 'VIP')),
  partner_name text,
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
drop policy if exists "Users manage their own profile" on public.profiles;
create policy "Users manage their own profile" on public.profiles for all using (auth.uid() = id) with check (auth.uid() = id);
