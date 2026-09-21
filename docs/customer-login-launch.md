# Customer login launch

The private Sites preview retains ChatGPT authentication and existing staff authorization. External customer login is a Supabase Auth integration and remains disabled until CUSTOMER_AUTH_ENABLED=true on the final HTTPS host. Customer accounts never inherit staff privileges. Existing preview users/bookings are not merged by email into external customer identities.

1. Create a hosted Supabase project. In Admin → Login & security, enter its project URL and **publishable** key (sb_publishable_...), plus the final website origin. Save.
2. Enable Google and Facebook in Supabase Authentication → Sign In / Providers. Register applications with Google Cloud and Meta. Copy the Supabase /auth/v1/callback URL into both provider consoles; store provider secrets only in Supabase. Complete the provider's production access/review requirements.
3. In Supabase URL Configuration, set the final Site URL and allow `https://YOUR-DOMAIN/auth/customer/callback/?flow=*` (the flow query is a random browser-bound state). Do not use broad host wildcards.
4. Enable email; set OTP length to 6 and expiry to the selected minutes. Configure production SMTP and verify sender domain. Copy the admin's generated HTML into both Magic Link and Confirm Signup templates and copy the chosen subject. Sender, template and expiry fields in the website are reference/export settings; apply them in Supabase/SMTP as directed.
5. Migrate the append-only database migrations, Worker environment bindings and routes with the website. Keep admin access configured separately. This feature does not establish new public staff login or grant customer accounts admin privileges.
6. Enable CUSTOMER_AUTH_ENABLED=true only on the intended HTTPS host after saving its exact origin. On this private preview, leave it unset/false. Activation requires no further application code for these flows.
7. Check new and returning emails, resend and rate limits, expired/reused/incorrect codes, social consent cancellation, missing provider email, account ownership, sign-out, and all-device sign-out. Test real Google/Meta credentials and real email delivery before launch; local tests use a mock provider.

Email is passwordless: the one-time code verifies ownership and signs the customer in. Supabase owns passwords/OTP generation, expiry and social identity verification. The website validates the returned identity through the provider, then stores a hashed opaque session token in a separate database table. Customer sessions expire after 7 days; logout revokes them immediately. Provider access/refresh tokens are not retained. App sessions are separate from Supabase sessions; for incident response revoke the customer's rows in customer_auth_sessions as well as disabling their provider account.

References:
- https://supabase.com/docs/guides/auth/auth-email-passwordless
- https://supabase.com/docs/guides/auth/sessions/pkce-flow
