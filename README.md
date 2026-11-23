# Deploy to Vercel
1. Edit CFG at the top of the script in index.html (admin email, WhatsApp number, email).
2. Push this folder to GitHub, then Vercel > Add New > Project > import it. No build step needed.
   (Or: npm i -g vercel, then run `vercel --prod` inside this folder.)
# Make it multi-user (real shared data)
1. Create a free project at supabase.com. Run supabase-setup.sql (change the admin email).
2. Authentication > Providers: keep Email on. For instant sign-up, turn off "Confirm email".
3. Settings > API: copy Project URL and anon public key into CFG.supabaseUrl and CFG.supabaseKey. Redeploy.
