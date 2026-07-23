# Website nis2scan.de

Statische Landingpage (Astro) für das Produkt nis2scan. Ein Produkt von letaible.

## Entwicklung

```bash
npm install
npm run dev        # http://localhost:4321
npm run build      # -> dist/ (statisch, CSS inline)
npm run preview    # gebautes dist/ lokal ansehen
```

## Deployment

`dist/` ist reines statisches HTML/CSS ohne externe Requests. Hostbar auf
Strato-Webspace (FTP-Upload von `dist/`), Cloudflare Pages oder GitHub Pages.
`site` in `astro.config.mjs` steht auf `https://nis2scan.de`.

## Deployment auf Strato (aktueller Stand)

Impressum, Datenschutzerklärung und Kontaktformular sind mit den echten
Angaben der Letaible GmbH gefüllt. Zum Livegang: Inhalt von `dist/` per SFTP
in das Verzeichnis `htdocs/nis2scan` laden, Domain nis2scan.de in der
Strato-Domainverwaltung auf dieses Verzeichnis zeigen lassen, SSL aktivieren.
Das Kontaktformular (`public/kontakt.php`) funktioniert erst auf dem
Strato-Server (PHP), nicht in der lokalen Vorschau.
