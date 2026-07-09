# UA Marketing Frontend

Static learning app for mobile game UA marketing.

## Responsibilities

- Dashboard, lessons, glossary, tools, case studies, AI chat UI, Final UA Plan.
- Local progress through `localStorage`.
- Optional Supabase login and cloud progress sync through `content/app-config.json`.
- Calls a separate backend for AI chat through `apiBaseUrl`.

## Local Run

```powershell
python -m http.server 4173
```

Open:

```text
http://127.0.0.1:4173
```

The default `content/app-config.json` points AI Chat to local backend:

```json
{
  "apiBaseUrl": "http://127.0.0.1:8787",
  "supabaseUrl": "",
  "supabaseAnonKey": ""
}
```

## Deploy

Deploy this `frontend` folder as its own Vercel project.

After backend deploy, update `content/app-config.json`:

```json
{
  "apiBaseUrl": "https://your-backend.vercel.app",
  "supabaseUrl": "https://your-project.supabase.co",
  "supabaseAnonKey": "your-supabase-publishable-key"
}
```

## Supabase

Run `supabase-schema.sql` in Supabase SQL Editor before enabling login/progress sync.

To push the 30 optimized lesson Markdown files directly without opening SQL Editor:

```powershell
.\scripts\sync-lessons-to-supabase.ps1
```

Dry-run validation:

```powershell
.\scripts\sync-lessons-to-supabase.ps1 -DryRun
```

Lesson Markdown is loaded DB-first from `public.ua_content_files`; static files in `content/lessons` are the fallback.
