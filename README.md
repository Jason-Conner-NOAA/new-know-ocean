# KnowOcean

KnowOcean is a static field journal about applied marine science. Articles can be discovered by topic, author, tag or date; the audio companion adds episode pages, show notes and a separate podcast RSS feed. See the [podcast publishing guide](docs/PODCAST.md) for recording metadata and feed launch checks.

## Run locally

Use Ruby 3.3 and Bundler. On Windows, run from native PowerShell with the RubyInstaller `bin` directory on the session's `PATH`. From the repository root:

```sh
bundle install
bundle exec jekyll serve
```

Open the address printed by Jekyll (normally `http://localhost:4000/`). Keep the local `url` and `baseurl` defaults; restart the server after changing configuration. To check a clean static build, run `bundle exec jekyll clean` and `bundle exec jekyll build`. Preview with Jekyll rather than opening source HTML from disk: layouts, data and generated archives are resolved at build time.

## Site map

Routes below are relative to the deployment root. On a project Pages site, prefix them with the Pages base path.

| Area | Routes | Contents |
| --- | --- | --- |
| Home | `/` | Featured article if selected, up to four other stories, topic index, latest episode and newsletter. |
| Explore | `/explore/`, `/explore/topics/`, `/explore/authors/`, `/explore/archive/` | Discovery hub, category guide, contributor-byline index and combined article/episode chronology. |
| Blog | `/blog/`, `/blog/archive/`, `/blog/categories/`, `/blog/tags/` | Newest-first listing, yearly archive and term directories. Individual articles use their post permalinks. |
| Generated listings | `/blog/category/<slug>/`, `/blog/tag/<slug>/` | Category and tag archives. Blog and term listings append `page/2/`, `page/3/`, etc. as needed; page one stays at the base route. |
| Podcast | `/podcast/`, `/podcast/episodes/`, `/podcast/guests/`, `/podcast/about/`, `/podcast/subscribe/` | Featured episode, archive, guest index, show description and subscription options. Episode links use the collection documents’ permalinks. |
| About | `/about/`, `/about/mission/`, `/about/editorial-approach/`, `/about/author/`, `/about/partners/` | Publication overview, mission, editorial policy, profiles and partnership disclosures. |
| Reader services | `/contact/`, `/newsletter/`, `/search/`, `/privacy/`, `/terms/`, `/404.html` | Inquiry instructions, signup status, keyword search, policy pages and not-found page. |
| Machine-readable | `/feed.xml`, `/podcast/feed.xml`, `/search.json`, `/sitemap.xml` | Jekyll Feed and Jekyll Sitemap generate the blog Atom feed and sitemap; the podcast RSS and search index have dedicated source templates. |

Public page permalinks live in [pages](pages), not in the primary navigation. Edit [_data/navigation.yml](_data/navigation.yml) for header/footer links. Search has its own header link; its [client](assets/js/search.js) uses `/search.json`, generated from a [Liquid template](pages/search-index.liquid) so JSON formatters do not rewrite its tags. Topic/archive browsing is available without JavaScript. The 404, podcast feed and search index templates set `sitemap: false`; this is separate from search-index inclusion (`search: false`) and robots metadata (`noindex`).

## Publish an article

1. Add a Markdown file under `_posts/` named `YYYY-MM-DD-short-title.md`. Start with front matter like this example, then write the article below the closing delimiter:

   ```yaml
   ---
   layout: post
   title: "What one buoy can tell us"
   description: "How a coastal temperature record is measured and interpreted."
   author: field-desk
   categories: [Ocean observation]
   tags: [buoys, temperature]
   featured: false
   ---
   ```

2. Match `author` to a key in [_data/authors.yml](_data/authors.yml), e.g. `field-desk: { name: Field Desk, bio: Notes from the editorial team. }`. Without a profile the byline falls back to the ID. Profiles with names appear on the About author page; Explore also lists IDs used by posts.
3. Use exact category names from [_data/topics.yml](_data/topics.yml) to file stories under curated topics. That file is a list of `name`/`description` pairs; configured topics get category pages even at zero posts. Other post categories and tags create archives automatically. The [editorial generator](_plugins/editorial.rb) derives slugs from names; use distinct, slug-friendly topic names so homepage links match. `editorial_page_size` defaults to 10 and must be positive.
4. The [post layout](_layouts/post.html) uses `subtitle` before `description` for the deck. For a photo, supply `featured_image` (or `image`), `image_alt` and optionally `image_caption`; use a site-root asset path or a `{path, alt}` mapping. Credit the source and verify reuse rights. `reading_time` overrides the estimate (200 words/minute, rounded up, minimum one). Two or more nonempty H2/H3 headings enable the client-side contents list unless `toc: false`.
5. Set `featured: true` to make the article eligible for the homepage pick and the featured lists on Explore and the first blog page. Related articles are selected by shared category or tag (up to three). Preview the article, its byline, listing, taxonomy links and mobile image before merging. Treat published permalinks as stable.

For standalone pages, follow a [page source](pages/about.html): use `layout: page`, `title`, `description` and an explicit `permalink`. Shared markup lives in [_includes](_includes), layouts in [_layouts](_layouts), styling in [assets/css/site.css](assets/css/site.css) and visual guidance in [docs/brand.md](docs/brand.md).

## Contact, newsletter and social settings

| Setting | Where it is used |
| --- | --- |
| `email` in site config | A public address, not a credential. [Contact](pages/contact.html) and the [footer](_includes/footer.html) render a mail link. Contact covers general questions, pitches/corrections, guest suggestions and partnerships (`/contact/#partnerships`). No address means no submission channel; there is no contact form. |
| `newsletter_url` in site config | The [newsletter component](_includes/newsletter.html) links to the signup destination from Home, posts and `/newsletter/`. Leave it blank until signup is live: readers get a closed notice and blog-feed link. Email collection happens at the provider, not in this site. |
| `_data/social.yml` | Optional list of `{name, url}` records for public accounts. Use full HTTPS profile URLs; omit the list or use `[]` to hide the footer social navigation. LinkedIn/email **share** links on articles are independent of these accounts. |

Before enabling a provider, replace the editable [privacy](pages/privacy.html) and [terms](pages/terms.html) placeholders with the actual operator, data handling and reuse policies. Podcast owner email is a separate, public feed setting, not a fallback for site contact.

## Deploy to GitHub Pages

1. Select **Settings → Pages → Build and deployment → Source: GitHub Actions**. Use the [Pages workflow](.github/workflows/pages.yml), not Pages’ default branch-based Jekyll build: the blog and taxonomies need the custom Ruby generator.
2. Merge reviewed source to `main`. The deployment workflow builds the static site and deploys its output (`_site/`) to Pages. Do not edit the generated output. Check the build and deploy jobs in **Actions**; a failed build is not a successful publish.
3. Actions derives `url` from the Pages origin and `baseurl` from its `base_path`. For `https://owner.github.io/journal/`, those are `https://owner.github.io` and `/journal`; for a root deployment the base path is empty. Do not hard-code the repository name into content. Use `relative_url` for internal links/assets and `absolute_url` for canonical and feed URLs.
4. Open the deployed URL from the workflow. Follow a nested navigation link, load an image, try an article search, and check a category archive. Inspect a canonical link, `/sitemap.xml`, `/feed.xml` and `/podcast/feed.xml` at the deployed base path. Expect production HTTPS URLs, no localhost, and no missing or doubled repository prefix. Parse `/search.json` as JSON rather than relying on an HTTP success code alone.

If taxonomy pages are missing, check that the generator ran without safe mode. If assets work locally but not on Pages, compare the rendered URLs with the Pages base path. To recover a bad release, revert the source change on `main` and verify the replacement deployment.