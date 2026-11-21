# KnowOcean brand and image register

Source audit: 20 November 2026. KnowOcean informs the palette; EGU Blogs informs how readers find and scan articles. Neither reference site's artwork, fonts, CSS or copy is bundled here.

## Reference evidence

**[KnowOcean](https://knowocean.org/).** The homepage delivers its theme CSS in an inline `style` element. The separate [font stylesheet](https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap) declares Merriweather 400 and 700. The theme sets Georgia for body copy, bold Merriweather for headings, and a thin green gradient underline for prose links. These are observed site styles, not a formal brand manual.

| Source declaration | Verified role |
|---|---|
| `#05bf85` | Primary accent: links, button backgrounds, quote rules and mobile navigation button. The link hover/focus declaration uses `green` (`#008000`). |
| `#242e2b` | Heading text, footer background and HTML theme color. Not an inferred color sampled from the photograph. |
| `#a8adac` | Secondary neutral: captions, footer links, current navigation item and input borders. |
| `#f9fafa`, `#fafafa`, `#fff` | Feature fallback, code/select surfaces, and button text respectively. The body uses a fixed [ocean image](https://knowocean.org/assets/images/OceanDepths_bg.png), not a single verified brand background HEX. |

The header image and shortcut icon point to the same [original SVG](https://knowocean.org/assets/logos/logo.svg). The response contains a 1024 × 1024 vector drawing with many colored paths, including `#082832` and `#258a9b`; these are artwork fills, not link or text tokens. This is the best verified original. The head also advertises PNG favicon/touch variants at 16, 32, 96, 120, 144, 180, 512 and 1024 px. All advertised paths returned 404 when checked, including the [180 px touch icon](https://knowocean.org/assets/logos/logo@180px.png) and [largest PNG](https://knowocean.org/assets/logos/logo@1024px.png). The root ICO and linked manifest also returned 404. No logo-specific reuse permission was verified; use the local sounding-line design rather than tracing the SVG or assuming the theme licenses the logo.

**Public contact:** No KnowOcean mailbox was verified on the homepage or pages listed in its [sitemap](https://knowocean.org/sitemap.xml) (checked on the KnowOcean host despite the sitemap's Alembic canonical host). The [origin story](https://knowocean.org/blog/2024/11/10/origin-story/) has a recipient-less email **share** link; the [elements page](https://knowocean.org/elements/) shows a sample address. Neither is a contact. The `/contact/` and `/about/` routes returned 404. Obtain a confirmed address from the publisher rather than using a guessed one.

**[EGU Blogs](https://blogs.egu.eu/).** The header groups GeoLog, division blogs and the wider network. The photographic banner leads into paginated entries identified by division, headline, author, date, image, excerpt and read-more link. The footer provides network, division, social and policy navigation. Its [theme CSS](https://blogs.egu.eu/wp-content/themes/vivacity-egu/style.min.css?ver=1794363956) declares Open Sans, compact headline margins and smaller muted `.entry-meta` with dot separators. The design lesson is to keep attribution next to the headline and archives easy to reach, not to copy the theme. The [masthead](https://blogs.egu.eu/wp-content/themes/vivacity-egu/images/logo.svg) and [scalable favicon](https://blogs.egu.eu/wp-content/themes/vivacity-egu/images/favicons/default/favicon.svg) resolve as SVG; the [fallback](https://blogs.egu.eu/wp-content/themes/vivacity-egu/images/favicons/default/favicon.ico) is ICO and the [touch icon](https://blogs.egu.eu/wp-content/themes/vivacity-egu/images/favicons/default/favicon_apple.png) is PNG. EGU states [CC BY 4.0 unless otherwise indicated](https://blogs.egu.eu/copyright/); no EGU content or logo is reused.

## Local palette and contrast

The [site stylesheet](../assets/css/site.css) retains the source accent, ink and gray. Paper (`#fbfaf5`), section surface (`#eeefe7`), dark link (`#006a4b`), muted text (`#52615b`), divider (`#cbcec3`) and cover emphasis (`#b6e4cc`) are local adaptations. Navigation inherits its section's text color. Georgia headings, system sans body type and monospace labels require no hosted font. The SVG mark and favicon use a near-paper `#fcfaf2` dot.

[WCAG contrast](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html), calculated from linearized sRGB relative luminance, rounded to two decimals:

| Foreground | On paper | On section surface | On ink |
|---|---:|---:|---:|
| Ink | 13.39:1 | 12.09:1 | — |
| Dark link | 6.35:1 | 5.73:1 | 2.11:1 |
| Muted text | 6.24:1 | 5.63:1 | 2.15:1 |
| Source accent | 2.28:1 | 2.06:1 | 5.86:1 |
| Source gray | 2.18:1 | 1.96:1 | 6.16:1 |

Use ink, dark link or muted text on light surfaces; use paper, accent or source gray on ink. The cover's pale emphasis on ink is 9.97:1. The source green fails even the 3:1 large-text threshold on paper; the decorative divider on paper is only 1.53:1 and must not be the sole indicator of a control or state. These checks cover named solid-color pairs, not every rendered page or interaction.

## Artwork and reproduction

**Hero credit:** Claire Fackler, CINMS, NOAA; NOAA/NOS/NMS/CINMS, National Marine Sanctuaries Media Library. *California sea lions in the kelp forest off San Miguel Island*, NOAA Photo Library `sanc0181`. The [Commons file record](https://commons.wikimedia.org/wiki/File:California_sea_lions_in_the_kelp_forest_off_San_Miguel_Island.jpg) identifies this as a US public-domain NOAA official-duty work and also records the [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/) license from the [NOAA Flickr publication](https://www.flickr.com/photos/51647007@N08/5030208218/). The generator uses the [original JPEG](https://live.staticflickr.com/4089/5030208218_019fe7c27e_o.jpg), 3072 × 2304; the only edits are proportional resizing and JPEG recompression. No NOAA endorsement is implied.

From the workspace root, run `& .\_tools\make-home-images.ps1` in Windows PowerShell with network access and System.Drawing. The [generator](../_tools/make-home-images.ps1) is the editable source for the raster compositions; Georgia and Consolas are system fonts, not redistributed files. Generated assets are static and need no generator or network at site build time.

| Output | Decoded pixels | File bytes |
|---|---:|---:|
| [Mobile hero JPEG](../assets/images/san-miguel-small.jpg) | 720 × 540 | 33,879 |
| [Large hero JPEG](../assets/images/san-miguel.jpg) | 1440 × 1080 | 126,356 |
| [Apple touch PNG](../assets/images/brand/apple-touch-icon.png) | 180 × 180 | 2,689 |
| [Social preview PNG](../assets/images/brand/social.png) | 1200 × 630 | 21,534 |
| [Podcast cover template PNG](../assets/images/brand/podcast-artwork-template.png) | 3000 × 3000 | 111,332 |

Both JPEG widths match the homepage `srcset` descriptors. The [header mark](../assets/images/brand/mark.svg) (64-unit viewBox) and [favicon](../assets/images/brand/favicon.svg) (32-unit viewBox) are separate local vectors. Edge rendered the simplified favicon with visible green strokes at both 16 and 32 px. The touch icon, social card and opaque 24-bit RGB podcast template use the same local sounding-line motif. These are original project designs; no third-party logo license is asserted and no separate public reuse license is granted here. Edit the square-cover block in the generator to change its title or typography. This is a template, not submitted show artwork; no feed or contact configuration has been changed or validated.