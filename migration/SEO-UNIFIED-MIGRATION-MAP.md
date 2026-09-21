# SEO & AI Visibility — unified migration map

This private-development upgrade preserves the migration audit as the source of truth. It does not alter the live TangierExcursions.com website.

| Existing source | Unified field / behavior | Migration rule |
| --- | --- | --- |
| `page.title` / migrated SEO title | `seo:{path}.title` | Used as the protected fallback; never overwritten automatically |
| `page.meta.description` | `seo:{path}.description` | Preserved fallback; generated options remain drafts |
| `page.canonical[0]` / audited URL | `seo:{path}.canonical` | Protected; HTTPS Tangier Excursions URLs only |
| `page.meta.robots` | `index`, `follow`, advanced robots | Parsed into server-side defaults; preview remains globally noindex |
| `page.structured_data` | `schema`, `schemaMode=preserve` | Preserved exactly unless validated custom schema is approved |
| `og:*` metadata | `openGraph` | Preserved fallback with page override support |
| `twitter:*` metadata | `twitter` | Preserved fallback with page override support |
| `presence:{path}.questions` | `aeoQuestions` | Read as legacy AEO content until the unified profile is saved |
| `presence:{path}.summary/sources` | Existing rendered factual content | Retained; no deletion or duplicate automatic publication |
| Tour editor `seo` migration snapshot | Unified page profile after tour creation | Remains an immutable source snapshot for migrated tours |
| `admin-log` | SEO history | Every unified profile, keyword-map, redirect and platform-setting write is recorded |
| `discovery_terms` and links | Entity and intent grounding | Reused for discovery; no public taxonomy URL is generated automatically |
| Existing internal links | Link inventory | Read for inbound/outbound/orphan analysis; historic content is not rewritten |

## Safety boundaries

- URL changes, canonical changes and noindex actions on protected pages require explicit confirmation.
- AI outputs are drafts. The local provider uses existing page and inventory data and never creates numerical keyword metrics.
- Search Console, GA4, Bing and rank tracking remain visibly disconnected until legitimate credentials and approved APIs are configured.
- Sitemaps and `llms.txt` include only canonical, indexable resources; redirects and noindex pages are excluded.
