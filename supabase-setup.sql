-- Run once in Supabase: SQL Editor > New query. Replace the admin email first.
create table bookings (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),
  user_id uuid references auth.users(id) default auth.uid(),
  client_email text, name text, phone text, service text,
  date date, details text, status text default 'pending'
);
alter table bookings enable row level security;
create policy "own insert" on bookings for insert to authenticated with check (user_id = auth.uid());
create policy "own or admin read" on bookings for select to authenticated
  using (user_id = auth.uid() or (auth.jwt()->>'email') = 'admin@example.com');
create policy "admin update" on bookings for update to authenticated
  using ((auth.jwt()->>'email') = 'admin@example.com');
create policy "admin delete" on bookings for delete to authenticated
  using ((auth.jwt()->>'email') = 'admin@example.com');
