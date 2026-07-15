# nis2scan.de — Website

Statische Landingpage (Astro) für das Produkt nis2scan. Ein Produkt von letaible.

## Entwicklung

```bash
npm install
npm run dev        # http://localhost:4321
npm run build      # -> dist/ (statisch, CSS inline)
npm run preview    # gebautes dist/ lokal ansehen
```

## Deployment

`dist/` ist reines statisches HTML/CSS ohne externe Requests — hostbar auf
Strato-Webspace (FTP-Upload von `dist/`), Cloudflare Pages oder GitHub Pages.
`site` in `astro.config.mjs` steht auf `https://nis2scan.de`.

## Vor dem Livegang (Pflicht)

- **Impressum** (`src/pages/impressum.astro`): alle `[…]`-Platzhalter mit den
  echten Betreiberangaben (letaible / Inhaber) füllen.
- **Datenschutz** (`src/pages/datenschutz.astro`): Hosting-Anbieter (EU-Region),
  Log-Speicherdauer und zuständige Aufsichtsbehörde eintragen.
- Quelle der Rechtstexte: `../nis2scan-planning/recht/` (anwaltlich zu prüfen).
