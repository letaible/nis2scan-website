import { defineConfig } from "astro/config";

// Static output — deployable to any host (Strato Webspace, Cloudflare/GitHub
// Pages). Set `site` to the final domain so canonical URLs and sitemaps are
// correct.
export default defineConfig({
  site: "https://nis2scan.de",
  build: { format: "directory" },
});
