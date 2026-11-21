Project: Professional Blog & Future Podcast Platform

Act as a senior web architect, Jekyll developer, UI/UX designer, and digital publishing strategist.

Your task is to design and build a sophisticated, modern, content-driven website using Jekyll, optimized for deployment and long-term hosting on GitHub Pages.

This website will initially serve as an active blog and thought-leadership platform, with the intention of expanding into a podcast publishing platform.

Treat this as a long-term digital publishing project, not a simple static website.

1. Technology and Architecture

Use:

Jekyll as the static site generator.
Liquid for templating.
HTML5, modern CSS, and vanilla JavaScript.
Markdown for blog posts and editorial content.
YAML for configuration and structured content.
GitHub Pages for hosting.

Requirements:

Use a clean, modular Jekyll architecture.
Follow GitHub Pages compatibility requirements.
Prefer GitHub Pages-supported plugins.
Avoid unnecessary dependencies and complex build tooling.
Ensure all internal links and assets work with GitHub Pages base paths.
Make the website easy to maintain and extend.
Use reusable layouts, includes, and components.

If GitHub Actions is needed for additional build functionality, implement a reliable deployment workflow.

2. Design Direction and User Experience

Create a visually distinctive, editorial-quality website .

The design should feel:

Modern and sophisticated.
Professional but approachable.
Editorial rather than corporate.
Clean, uncluttered, and content-focused.
Visually memorable without unnecessary decoration.

Design requirements:

Excellent typography and readable text hierarchy.
Thoughtful whitespace and content spacing.
Beautiful headlines and featured article layouts.
Responsive desktop, tablet, and mobile experiences.
Subtle transitions and animations.
Carefully designed navigation.
Consistent visual language across all pages.
Accessible color contrast and keyboard navigation.

Avoid generic blog templates and overly familiar Bootstrap-style layouts.

Aim for the visual quality of a premium independent publication.

3. Website Structure

Build the following pages and sections:

Homepage
Distinctive editorial hero section.
Clear introduction to the publication and its purpose.
Featured or highlighted article.
Latest articles section.
Topic/category highlights.
Podcast introduction or coming-soon section.
Newsletter subscription area.
Professional footer.
Blog
Main article listing.
Featured articles.
Categories and tags.
Pagination.
Individual article pages.
Publication dates and estimated reading times.
Author information.
Related articles.
Social sharing links.
About
Publication mission and editorial perspective.
Author/founder introduction.
Professional biography.
Contact information.
Podcast

Prepare the infrastructure for a future podcast launch.

Include:

Podcast landing page.
Podcast introduction and description.
Featured episode area.
Episode listing.
Individual episode pages.
Episode show notes.
Guest information.
Episode artwork.
Audio player interface.
Transcript support.
Links to external podcast platforms.

Initially, display a tasteful "Coming Soon" state if no episodes have been published.

Do not fabricate episodes, audio files, guests, or podcast platform links.

Contact
Professional contact page.
Email contact link.
Optional social media links.
4. Jekyll Content Architecture

Create a scalable content structure using Jekyll collections where appropriate.

Suggested content organization:

_posts/ for blog articles.
_episodes/ for podcast episodes.
_layouts/ for page and content layouts.
_includes/ for reusable interface components.
_data/ for navigation, social links, and site configuration.
assets/ for CSS, JavaScript, images, and media artwork.
pages/ for standalone website pages.

Use front matter consistently.

Blog post front matter should support:

Title
Description
Date
Author
Categories
Tags
Featured image
Featured article status
Estimated reading time
SEO metadata

Podcast episode front matter should support:

Episode title
Episode number
Publication date
Description
Guest
Episode artwork
Audio URL
Audio duration
Show notes
Transcript
External listening links

Make it easy to publish new articles and episodes by creating Markdown files without modifying templates or application code.

5. Podcast-Ready Infrastructure

Although the podcast may launch later, prepare the architecture now.

Implement:

A dedicated podcast collection.
Individual episode pages.
A reusable audio player component.
Podcast artwork support.
Episode metadata.
Show notes and transcript layouts.
Podcast RSS feed infrastructure.

Plan for compatibility with podcast distribution platforms such as Apple Podcasts and Spotify.

Important:

Design a standards-compliant podcast RSS feed with the appropriate podcast namespace and episode enclosure metadata.
Support audio URLs hosted by an external podcast hosting provider.
Do not assume GitHub Pages should host large audio files.
Document how to configure the feed and connect it to a podcast hosting service.
Do not claim that the podcast is ready for distribution until its feed, artwork, hosting, and required metadata have been configured and validated.
6. Publishing and Discovery Features

Implement:

Blog RSS/Atom feed.
Podcast RSS feed infrastructure.
XML sitemap.
robots.txt.
Canonical URLs.
Open Graph metadata.
Social sharing metadata.
Structured data using appropriate Schema.org types.
SEO-friendly URLs.
Search engine-friendly article pages.
Category and tag archives.
Accessible navigation.
Static site search if practical.

Optimize for discoverability through search engines and social platforms.

7. Newsletter and Audience Development

Create a newsletter subscription section with a clean, professional design.

Make the subscription component integration-ready for an external newsletter provider.

Do not create a fake subscription form or pretend submissions are being stored.

If no provider is configured, provide an honest placeholder and document the integration process.

8. Performance and Accessibility

Prioritize:

Fast page loading.
Lightweight JavaScript.
Optimized images.
Responsive image handling.
Semantic HTML.
WCAG accessibility principles.
Keyboard navigation.
Screen-reader compatibility.
Reduced-motion preferences.
Good Core Web Vitals.

Avoid unnecessary animations, libraries, and external dependencies.

9. GitHub Pages Deployment

Make GitHub Pages deployment a first-class requirement.

Ensure:

The Jekyll project builds successfully.
The configuration supports a GitHub Pages project repository.
The baseurl and url settings are correct.
Relative asset paths are generated correctly.
Permalinks work correctly.
RSS feeds and sitemap URLs are correct.
All pages work when deployed under a repository subdirectory.
The README includes complete deployment instructions.

Include a GitHub Actions workflow only if required by the selected build architecture.

10. Development Process

Work in the following phases:

Phase 1 – Discovery and Planning

Inspect the existing repository before making changes.
Identify existing files, assets, and configuration.
Propose the site architecture.
Establish the design direction and typography.
Identify GitHub Pages constraints.

Phase 2 – Foundation

Set up Jekyll.
Configure the site.
Create layouts, includes, collections, and data files.
Establish the design system.

Phase 3 – Website Development

Build the homepage.
Build the blog and article templates.
Build About and Contact pages.
Build the podcast landing page and episode templates.
Implement responsive navigation and reusable components.

Phase 4 – Publishing Infrastructure

Implement feeds, sitemap, SEO metadata, categories, tags, and search.
Prepare the podcast RSS infrastructure.
Document newsletter integration.

Phase 5 – Quality Assurance

Run a complete Jekyll build.
Fix build errors and broken links.
Check desktop and mobile layouts.
Verify GitHub Pages baseurl compatibility.
Check accessibility and performance.
Validate the RSS and sitemap output.

Phase 6 – Documentation

Create a comprehensive README.
Explain how to publish blog posts.
Explain how to add podcast episodes.
Explain how to configure podcast RSS.
Explain how to deploy and maintain the website.
11. Important Development Rules
Do not stop after creating a homepage mockup.
Build the complete website architecture.
Do not use fabricated testimonials, articles, guests, or statistics.
Use tasteful placeholder content only where necessary.
Do not hardcode content that should be managed through Markdown or YAML.
Do not introduce unnecessary frameworks.
Keep the design consistent across every page.
Do not sacrifice visual quality for technical simplicity.
Make the website genuinely usable and ready for ongoing publishing.

Before implementation, present your proposed architecture and design direction. Then proceed with implementation in manageable phases.

The final result should be a polished, publication-quality blog with a podcast-ready foundation, capable of growing into a recognizable independent media platform.

VISUAL DESIGN REFERENCE: EGU BLOGS

Reference website: https://blogs.egu.eu/

Use this website as the primary visual and UX inspiration for the design of our Jekyll publication.

IMPORTANT: This is a visual reference only. Do not copy its content, branding, logo, identity, wording, imagery, or exact implementation.

Our website must have its own distinctive publication identity.

1. Overall Design Philosophy

Recreate the visual character of a well-established scientific and editorial publishing network.

The design should feel:

Editorial and publication-oriented.
Professional, credible, and informative.
Clean, structured, and content-first.
Academically inspired without feeling outdated.
Image-rich but not visually cluttered.
Designed for frequent publishing and long-term readership.

Avoid the appearance of a generic personal blog, SaaS landing page, or startup website.

2. Header and Navigation

Take inspiration from the reference website's structured navigation.

Implement:

A clean publication header.
Prominent publication name or logo.
Primary horizontal navigation.
Clearly organized secondary navigation for topics and categories.
Responsive mobile navigation.
Consistent navigation across all pages.

Keep the header relatively compact and functional.

3. Hero and Featured Imagery

Use large editorial photography and carefully selected imagery.

Implement:

A prominent photographic banner or visual identity area.
A featured article presentation.
Strong headline typography.
A restrained use of accent colors.
Consistent image proportions and treatment.

Photography should support the editorial subject matter rather than serve as decoration.

4. Blog Listing Design

This is the most important design reference.

Recreate the editorial article-listing approach:

Each article entry should include:

A small category or topic identifier.
A prominent article headline.
Author attribution.
Publication date.
A readable excerpt.
A clear Read More link.

Use generous spacing between entries.

Prioritize readability and information hierarchy over card-heavy layouts.

Avoid excessive rounded cards, shadows, gradients, and unnecessary interface decoration.

5. Typography and Color

Establish a sophisticated editorial typography system.

Use:

Highly readable body typography.
Strong headline hierarchy.
Clear distinction between headings, metadata, and excerpts.
Comfortable line lengths.
Consistent spacing and alignment.

Use a predominantly light background with dark, readable text and a restrained accent palette.

Choose a distinctive accent color for links, navigation highlights, and category identifiers.

Do not reproduce EGU's exact color palette or typography.

6. Publication Structure

Borrow the reference site's organized publication approach.

Our website should support:

Latest articles.
Featured articles.
Topic and category navigation.
Author attribution.
Article archives.
Pagination.
Search.
Related articles.

Organize the interface so readers can easily discover content.

7. Podcast Integration

Adapt the same editorial visual language for the future podcast.

The podcast section should feel like a natural extension of the publication.

Use:

Consistent typography.
Matching navigation and spacing.
Editorial episode listings.
Episode artwork.
Prominent episode titles.
Author/guest information.
Integrated audio player.

Avoid making the podcast section look like a completely unrelated streaming application.

8. Responsive Design

Preserve the publication-style experience on all screen sizes.

Desktop:

Structured horizontal navigation.
Generous editorial content width.
Clear article hierarchy.
Appropriate photographic proportions.

Tablet:

Simplified navigation.
Balanced content width.
Consistent typography.

Mobile:

Compact navigation.
Readable article listings.
Comfortable touch targets.
Properly scaled imagery.
No horizontal overflow.
9. Implementation Instructions

Before modifying the project:

Inspect the reference website and study its actual visual organization.
Identify its header, navigation, imagery, article listing, typography, spacing, and footer patterns.
Inspect the existing Jekyll project.
Translate the visual principles into our own design system.
Present a proposed design before implementation.

Implement the design using reusable Jekyll layouts, Liquid includes, CSS variables, and responsive stylesheets.

Keep all existing publishing functionality intact.

Do not sacrifice the blog, SEO, RSS, podcast, or GitHub Pages architecture to achieve the visual design.

10. Final Design Objective

The finished website should evoke the credibility, editorial structure, and organized publishing experience of EGU Blogs while having a unique visual identity.

It should look like an established independent editorial publication that publishes frequently and has the infrastructure to grow into a podcast and broader media platform.

The result must be visually polished, easy to read, content-focused, and maintainable.

BRAND IDENTITY REFERENCE: KNOWOCEAN

Reference website: https://knowocean.org/

Use KnowOcean as the primary reference for our website's brand identity, color palette, and custom iconography.

The EGU Blogs website remains the reference for editorial layout and publishing experience.

IMPORTANT: Separate brand identity from page structure. Do not reproduce KnowOcean's website layout or copy its content.

1. Inspect the KnowOcean brand

Before implementing anything:

Visit https://knowocean.org/.
Inspect its publicly available HTML, CSS, stylesheets, and image assets.
Identify its actual brand colors and their HEX values.
Identify its primary and secondary colors.
Identify its background, text, link, and accent colors.
Inspect its header logo and favicon.
Identify the original icon format (SVG, PNG, ICO, or other).
Identify any distinctive typography and visual treatments.

Do not guess colors or substitute a generic marine-themed palette.

Create a brand reference document containing the discovered values and asset locations.

If an asset or color cannot be verified, explicitly identify it as unknown rather than inventing it.

2. Color palette implementation

Extract and reproduce the KnowOcean color palette accurately.

Create centralized CSS variables for:

Primary brand color.
Secondary brand color.
Accent color.
Main background.
Secondary background.
Surface/background for content sections.
Primary text.
Secondary text.
Links.
Navigation.
Borders and separators.

Use these variables consistently throughout the website.

Preserve the original brand colors rather than introducing unrelated colors.

Where necessary, create lighter and darker supporting shades while retaining the original brand identity.

Ensure text and interface elements maintain WCAG AA contrast.

3. Custom logo and icon

Inspect KnowOcean's existing logo and favicon.

Identify the best available original asset.

If we have permission to reuse it:

Preserve the original artwork.
Use the appropriate SVG or high-resolution image.
Avoid recreating or distorting the icon.
Support transparent backgrounds.
Ensure it works on light and dark backgrounds where applicable.

If direct reuse is not permitted, create a placeholder icon without copying the protected artwork.

Implement:

Website header logo.
Browser favicon.
Apple touch icon.
Social sharing identity.
Podcast artwork branding.
Consistent icon treatment throughout the interface.

Keep the logo and favicon as separate assets where appropriate.

Do not replace the custom brand icon with a generic Font Awesome or Lucide icon.

4. Combine the two visual references

Use the references according to these rules:

KNOWOCEAN:

Brand colors.
Logo and icon identity.
Brand personality.
Visual identity.

EGU BLOGS:

Editorial layout.
Article listing structure.
Navigation organization.
Publication hierarchy.
Content presentation.
Article metadata and archives.

The resulting design should combine KnowOcean's visual identity with EGU's structured editorial publishing experience.

5. Jekyll implementation

Implement the brand system centrally.

Use:

CSS custom properties.
Reusable Jekyll layouts.
Liquid includes.
Centralized asset management.
Responsive stylesheets.

Store brand assets in an organized directory such as:

assets/images/brand/ assets/images/icons/

Keep the implementation compatible with GitHub Pages and its baseurl configuration.

6. Validation

Before completing the work:

Compare the implemented colors against the reference.
Verify the logo and icon assets.
Check the header on desktop and mobile.
Verify favicon rendering.
Check text contrast.
Ensure the podcast and blog share a consistent identity.
Document the final color palette and asset sources.

Do not change the established editorial architecture.

The final result should look like a distinctive, professionally branded independent publication rather than a copy of either reference website.

WEBSITE INFORMATION ARCHITECTURE AND COMPLETE PAGE BUILDOUT

Extend the existing Jekyll website into a complete, multi-page editorial publishing platform.

Do not build just a homepage with a few placeholder pages.

Create every page, child page, archive, and content template described below.

All pages must have working navigation, appropriate layouts, consistent branding, and GitHub Pages-compatible URLs.

1. Main navigation

Create the following primary navigation:

Home
Explore
Blog
Podcast
About
Contact

Include appropriate dropdown or secondary navigation where useful.

2. Home

URL: /

Include:

Publication introduction and hero.
Featured article.
Latest articles.
Browse by topic.
Featured podcast section.
About the publication.
Newsletter subscription.
Social links.
3. Explore

URL: /explore/

Create a content discovery landing page.

Child pages:

/explore/topics/
/explore/authors/
/explore/archive/

Include topic discovery, featured content, and links to relevant articles.

4. Blog

URL: /blog/

Child pages:

/blog/categories/
/blog/tags/
/blog/archive/
/blog/category/category-name/
/blog/tag/tag-name/

Individual article URLs:

/blog/YYYY/MM/DD/article-slug/

Every article must include:

Title and subtitle.
Featured image.
Author and publication date.
Category and tags.
Estimated reading time.
Article body.
Table of contents where appropriate.
Related articles.
Previous and next article navigation.
Social sharing.
Newsletter subscription prompt.

Support pagination and SEO metadata.

5. Podcast

URL: /podcast/

Child pages:

/podcast/episodes/
/podcast/guests/
/podcast/about/
/podcast/subscribe/

Individual episode URLs:

/podcast/episodes/episode-slug/

Every episode should support:

Episode number.
Title and description.
Episode artwork.
Audio player.
Publication date and duration.
Guest biography.
Show notes.
Chapters where available.
Transcript.
External listening links.
Related articles and episodes.

If the podcast has not launched, display a polished coming-soon experience without fabricated episodes.

6. About

URL: /about/

Child pages:

/about/mission/
/about/editorial-approach/
/about/author/
/about/partners/

Use appropriate pages for the publication's mission, editorial principles, founder biography, and partnerships.

Do not fabricate people, affiliations, or partnerships.

7. Contact

URL: /contact/

Include:

General inquiries.
Editorial submissions.
Podcast guest inquiries.
Partnership inquiries.

Provide functional email links. Only implement submission forms when an actual submission service is configured.

8. Additional utility pages

Create:

/search/
/newsletter/
/privacy/
/terms/
/404.html

Include a functional static-site search experience.

Privacy and terms pages should contain clearly identified editable legal-content placeholders, not fabricated legal assurances.

9. Global components

Every appropriate page should use consistent reusable components:

Header and primary navigation.
Breadcrumb navigation.
Footer.
Search interface.
Newsletter signup.
Article cards.
Author information.
Category labels.
Pagination.
Social sharing.
Related content.
10. Jekyll architecture

Use reusable layouts, includes, collections, data files, and Markdown content.

Avoid duplicating page markup.

Create a complete sitemap.xml and ensure all intended public pages are discoverable.

Use consistent permalink conventions.

Ensure all pages work under GitHub Pages project-site baseurl configurations.

11. Implementation and verification

First inspect the existing repository.

Then:

Produce a complete sitemap.
Identify existing pages and missing pages.
Create the missing layouts and content templates.
Build the navigation hierarchy.
Implement all page templates.
Verify every internal link.
Verify breadcrumbs and parent-child relationships.
Run a complete Jekyll build.
Check desktop and mobile layouts.

Do not silently omit pages. If a feature requires an external integration, build its presentation and document the required integration rather than pretending it works.

The finished website must feel like a complete, coherent editorial publication rather than a collection of disconnected pages.