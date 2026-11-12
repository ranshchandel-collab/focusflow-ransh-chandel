# Launch checklist

## Supabase

1. Create a Supabase project and run `supabase/schema.sql` in its SQL Editor.
2. Enable Google and Azure (Microsoft) sign-in under Authentication → Providers.
3. Add your deployed URL and `/auth/callback` to the provider redirect URLs.
4. Copy the project URL and public anon key into your deployment environment variables, using `.env.example` as the template.

## Hosting and HTTPS

Deploy the static site to Vercel, Netlify, or Cloudflare Pages. Each supplies a temporary HTTPS URL automatically. This project includes `vercel.json`, so publishing it on Vercel will issue HTTPS automatically. For a custom domain, add the domain in the hosting dashboard and follow its DNS instructions; SSL is then issued automatically.

## Important

Never expose Supabase service-role keys, OAuth client secrets, or payment-provider secrets in this frontend repository. Use server-side functions for privileged actions and hosted Stripe Checkout for payments.
