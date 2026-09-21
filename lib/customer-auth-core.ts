// Pure validation shared by the provider adapter and regression tests.
export function safeReturn(value: unknown) {
  if (typeof value !== 'string' || !value.startsWith('/') || value.startsWith('//') || /[\\\r\n]/.test(value)) return '/account/';
  const u = new URL(value, 'https://return.invalid');
  if (u.origin !== 'https://return.invalid' || /^\/(?:api|auth|login|signup|admin|signin-with-chatgpt|signout-with-chatgpt|callback)(?:\/|$)/.test(u.pathname)) return '/account/';
  return u.pathname + u.search + u.hash;
}
export function validEmail(value: unknown) {
  if (typeof value !== 'string' || value.length > 254 || !/^[^\s@<>]+@[^\s@<>]+\.[^\s@<>]+$/.test(value)) throw Error('Enter a valid email address.');
  return value.trim().toLowerCase();
}
export function verifiedCustomer(user: any) {
  if (!user?.id || !user.email_confirmed_at || !user.email || user.is_anonymous) throw Error('Please verify your email before signing in.');
  return {id:'customer:'+user.id, email:validEmail(user.email), name:String(user.user_metadata?.full_name || user.user_metadata?.name || user.email.split('@')[0]).slice(0,120), role:'customer' as const};
}
export function sameOrigin(request: Request) {
  return request.headers.get('origin') === new URL(request.url).origin && request.headers.get('sec-fetch-site') !== 'cross-site';
}
