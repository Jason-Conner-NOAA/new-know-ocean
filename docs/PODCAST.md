# Publish the KnowOcean Podcast

Podcast publishing has three separate outcomes: an episode page, an RSS item, and a subscription link. A published page need not have an enclosure, and hiding the subscription link does **not** disable the feed. The contracts are the [episode layout](../_layouts/episode.html), [catalog](../_includes/podcast/catalog.html), [eligibility check](../_includes/podcast/feed-eligible.html) and [RSS template](../pages/podcast-feed.xml). For build and deployment, see the [site README](../README.md).

## Configure the show

Edit [the podcast data](../_data/podcast.yml). Use real public values; leave unconfigured optional fields unset rather than inventing artwork, owner details or directory listings.

| Key | Use |
| --- | --- |
| `title`, `description`, `language`, `explicit` | RSS channel metadata. Use a language code and a YAML boolean for `explicit`. The episode header uses the show title; the podcast landing and About pages use the description. |
| `about` | Extra prose on `/podcast/about/`, not the RSS description. |
| `author`, `category` | Optional iTunes author and category. The supplied category is `Science`. |
| `owner_name`, `owner_email` | An iTunes owner block is emitted only when both are set. The email will be public in XML. |
| `artwork` | Show artwork URL or site-root asset path. Used for the channel image and as a fallback on episode pages. |
| `platforms` | Show-level list of `{label, url}` links on `/podcast/subscribe/`; use actual listening destinations. An entry needs both nonempty values. |
| `advertise_feed` | YAML boolean, initially `false`. Controls the Subscribe page’s RSS button, not generation, access control or directory submission. |

## Add an episode

With the `episodes` collection configured for output, add `_episodes/<slug>.md`. Use an explicit date with a timezone. The following illustrates the shape, **not** a recording ready to submit: replace the example URLs, date, byte count and identity before publishing.

```yaml
---
layout: episode
title: "Reading a coastal temperature record"
description: "A conversation about what a buoy measures and what it misses."
date: 2026-06-01 09:00:00 +0000
published: true
featured: false
episode_number: 1
duration: "00:24:16"
guid: "urn:uuid:042833af-37e4-4a46-9644-c2c5bd813270"
audio_url: "https://media.example.org/coastal-record.mp3"
audio_type: audio/mpeg
audio_bytes: 23296000
guest:
  name: "Example Guest"
  bio: "Maintains coastal observing instruments."
chapters:
  - {time: "00:00", title: "At the buoy"}
  - {time: "08:35", title: "Interpreting the record"}
---
Describe the conversation here. Link to the datasets, papers and field notes discussed.
```

The Markdown body becomes **Show notes**. A nonempty `audio_url` alone displays the browser player and an “Open audio file” link; the layout does not check the media server. Use the direct media resource, not a player or download landing page.

Additional optional front matter:

- `artwork` overrides the show cover on the page and adds an item-level iTunes image. `explicit: true` or `false` overrides the channel rating for that item; omit it to inherit the show value.
- `listening_links` is a list of `{label, url}` for **this episode**, distinct from show-level `platforms`. `guest` is one mapping, not a list. Use consistent `guest.name` spelling across episodes for grouping.
- `chapters` is an ordered list of `time` and `title`. Quote time strings to preserve formatting. The page displays these as text, not seek controls.
- `transcript` accepts inline Markdown (use a YAML `|` block for multiple lines); `transcript_url` links to a transcript. Both can appear together.
- `related_urls` is a list of exact Jekyll document URLs without the deployment prefix. Only matching, non-self, non-future documents not marked unpublished appear. External URLs and ordinary site pages do not match this lookup.

## Where an episode appears

The podcast catalog and RSS iterate episodes dated **at or before build time** and not marked `published: false`, newest first. Schedule a rebuild after a future release time; a static deployment does not update when the clock changes. These are listing filters, not privacy controls.

| Route | Selection |
| --- | --- |
| `/podcast/` | Newest `featured: true` episode, otherwise newest episode; “Coming soon” if none. The publication homepage separately selects the latest date from `site.episodes`, not this featured pick. |
| `/podcast/episodes/` | All catalog episodes, including pages without feed-ready audio. |
| `/podcast/guests/` | Groups by nonempty guest name, sorted by name; bio comes from the first episode in each group. |
| `/podcast/about/` | Show description and `about` text. |
| `/podcast/subscribe/` | Platform buttons require a catalog episode and valid link entries. RSS button requires `advertise_feed: true` **and** at least one eligible episode. If neither kind of link is available, the page says subscriptions are not open. |

## RSS eligibility and identity

`/podcast/feed.xml` is a dedicated RSS 2.0 template with Atom self-link and iTunes metadata (`itunes:type` is `episodic`). It is separate from the journal’s `/feed.xml`. The channel can render with **zero items**. Beyond the publication/date filters, an item must pass all of these checks:

1. `title`, `description` and `audio_url` are present and nonempty. Use meaningful text; the test does not validate the URL or fetch the audio.
2. The first six characters of `audio_type` are exactly `audio/`. Supply the actual MIME type, such as `audio/mpeg` for MP3.
3. `audio_bytes` is positive and its string representation matches the result after numeric conversion. Use a plain positive whole-number byte count from the final file, not KB, a duration, a formatted number or a zero-padded string. The template checks the value’s form, not its accuracy.

Each accepted item has a title, description, absolute episode link, RFC 822 publication date, explicit rating and enclosure (`url`, `length` in bytes, `type`). The GUID has `isPermaLink="false"`: `guid` wins, otherwise the absolute episode page URL is used. Assign a unique permanent GUID before first publication and keep it through title, host or permalink changes to avoid duplicate episodes. Do not reuse the example GUID. `duration`, `episode_number` and episode `artwork` emit optional iTunes elements. Guests, chapters, transcripts, show notes and listening links are page features, not extra RSS elements in this template.

## Release checklist

1. Upload the final media and artwork to stable public URLs. Check the recording opens without a login, plays and seeks. Measure the final file (in PowerShell, `(Get-Item .\coastal-record.mp3).Length`); check the served MIME type and byte length against the enclosure. Replace any example metadata.
2. Preview with `bundle exec jekyll serve`. Check the episode page, transcript, related documents, archive order, guest grouping and Subscribe state. If the page plays but the item is missing, inspect the date, `published`, and all three eligibility checks above.
3. Merge to `main` and verify the Pages deployment. Keep `advertise_feed: false` until the live feed is ready. Open the **deployed** podcast XML directly; parse it as XML, verify the expected item and stable GUID, and follow its enclosure. Check channel/self, artwork and episode URLs against the production origin and Pages base path. Localhost output is not suitable for submission.
4. Validate the public feed, media and artwork against the intended directories’ current requirements. A passing template check does not guarantee directory acceptance. Set `advertise_feed: true` and redeploy when ready; submit the production feed URL to directories and add confirmed show URLs to `platforms` as they become available. Verify the buttons on the live Subscribe page.