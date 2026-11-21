# frozen_string_literal: true

require 'digest'

module KnowOcean
  class Editorial < Jekyll::Generator
    priority :low

    def generate(site)
      @site = site
      @size = Integer(site.config.fetch('editorial_page_size', 10))
      raise ArgumentError, 'editorial_page_size must be positive' unless @size.positive?

      posts = site.posts.docs.sort.reverse
      blog = site.pages.find { |page| page.data['permalink'] == '/blog/' }
      paginate(blog, posts) if blog

      topics = Array(site.data['topics']).to_h { |row| [row.fetch('name'), row['description']] }
      site.data['editorial_categories'] = archives('category', site.categories, topics)
      site.data['editorial_tags'] = archives('tag', site.tags, {})
    end

    private

    def archives(kind, groups, descriptions)
      used = {}
      (descriptions.keys + groups.keys.sort).uniq.to_h do |name|
        slug = Jekyll::Utils.slugify(name)
        slug = "#{slug.empty? ? 'term' : slug}-#{Digest::SHA256.hexdigest(name)[0, 12]}" if slug.empty? || used[slug]
        used[slug] = true
        path = "/blog/#{kind}/#{slug}/"
        posts = Array(groups[name]).sort.reverse
        term = { 'name' => name, 'url' => path, 'count' => posts.size,
                 'description' => descriptions[name] }
        page = new_page(path, 'layout' => 'taxonomy', 'title' => name,
                        'description' => descriptions[name] || "Articles filed under #{name}.",
                        'taxonomy_kind' => kind)
        paginate(page, posts)
        [name, term]
      end
    end

    def new_page(path, fields)
      page = Jekyll::PageWithoutAFile.new(@site, @site.source, path.delete_prefix('/'), 'index.html')
      page.data.merge!(fields.merge('permalink' => path))
      @site.pages << page
      page
    end

    def paginate(first, posts)
      base = first.data.fetch('permalink')
      fields = first.data.dup
      total = [(posts.length + @size - 1) / @size, 1].max
      path = ->(n) { n == 1 ? base : "#{base}page/#{n}/" }
      (1..total).each do |n|
        page = n == 1 ? first : new_page(path.call(n), fields.merge('title' => "#{fields['title']} — Page #{n}", 'search' => false))
        page.data['listing_posts'] = posts.slice((n - 1) * @size, @size)
        page.data['pagination'] = { 'number' => n, 'total' => total,
                                    'previous' => (path.call(n - 1) if n > 1),
                                    'next' => (path.call(n + 1) if n < total) }
      end
    end
  end
end