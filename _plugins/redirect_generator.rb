# _plugins/redirect_page_generator.rb

module Jekyll
  class RedirectPage < Page
    def initialize(site, base, dir, name, target_url)
      @site = site
      @base = base
      @dir = dir
      @name = name
      self.process(name)
      self.content = redirect_content(site, target_url)
      self.data = {
        "layout" => nil,
        "sitemap" => false, # Optionally, to exclude from sitemap
      }
    end

    def redirect_content(site, target_url)
      <<-HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="refresh" content="0; url=#{site.baseurl}#{target_url}">
  <title>Redirecting...</title>
</head>
<body>
  <p>This page has moved to <a href="#{site.baseurl}#{target_url}">#{site.baseurl}#{target_url}</a>.</p>
  <script>window.location.href = "#{site.baseurl}#{target_url}";</script>
</body>
</html>
      HTML
    end
  end

  class RedirectGenerator < Generator
    safe true
    priority :low

    def generate(site)
      site.posts.docs.each do |post|
        original_url = post.url
        yy = post.date.strftime('%y')
        mm = post.date.strftime('%m')
        # The directory for the old URL structure, without the base filename
        old_dir = "/#{yy}/#{mm}"

        site.pages << RedirectPage.new(site, site.source, old_dir, original_url, original_url)
      end
    end
  end
end
