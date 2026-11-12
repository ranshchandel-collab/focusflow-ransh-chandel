# FocusFlow

A responsive, static productivity website. Open `index.html` locally for the demo.

## Sign-in demo

Google and Microsoft sign-in use Supabase Auth when the providers have been enabled in your connected Supabase project. Email sign-in uses a passwordless link. No passwords are collected by FocusFlow.

## Production authentication

To offer real sign-in, deploy this site to a domain and add a backend/auth provider (for example, Supabase Auth, Firebase Authentication, or Auth.js). Register the domain's callback URL with both Google Cloud and Microsoft Entra ID, then store provider secrets only on the server—never in this static frontend.
