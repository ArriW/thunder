module Jekyll
  class LinkChecker < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      @site = site
      @broken_links = []
      
      # Check all pages and posts for broken internal links
      all_content = site.pages + site.posts.docs
      
      all_content.each do |content|
        check_content(content)
      end
      
      # Report broken links
      if @broken_links.any?
        Jekyll.logger.warn "Link Checker:", "Found #{@broken_links.length} broken internal links:"
        @broken_links.each do |link|
          Jekyll.logger.warn "  - #{link[:file]}: #{link[:url]}"
        end
      else
        Jekyll.logger.info "Link Checker:", "All internal links are valid! ✅"
      end
    end

    private

    def check_content(content)
      return unless content.content
      
      # Find all internal links
      internal_links = content.content.scan(/\[([^\]]+)\]\(([^)]+)\)/)
      
      internal_links.each do |link_text, url|
        next if url.start_with?('http') # Skip external links
        next if url.start_with?('#') && url.length > 1 # Skip anchor-only links for now
        
        # Clean up the URL
        clean_url = url.gsub(/^\//, '').gsub(/\/$/, '')
        
        # Check if it's a Jekyll liquid tag
        if url.include?('{{') && url.include?('}}')
          # For liquid tags, extract the path
          liquid_url = url.match(/["']([^"']+)["']/)[1] rescue nil
          next unless liquid_url
          clean_url = liquid_url.gsub(/^\//, '').gsub(/\/$/, '')
        end
        
        # Check if the target exists
        unless link_exists?(clean_url)
          @broken_links << {
            file: content.relative_path || content.path,
            url: url,
            text: link_text
          }
        end
      end
    end

    def link_exists?(url)
      # Check if it's a page permalink
      @site.pages.any? { |page| matches_permalink?(page, url) } ||
      # Check if it's a post URL
      @site.posts.docs.any? { |post| matches_permalink?(post, url) } ||
      # Check if it's a direct file path
      File.exist?(File.join(@site.source, url)) ||
      File.exist?(File.join(@site.source, url + '.md')) ||
      File.exist?(File.join(@site.source, url + '.html'))
    end

    def matches_permalink?(content, url)
      return false unless content.data['permalink']
      
      permalink = content.data['permalink']
      clean_permalink = permalink.gsub(/^\//, '').gsub(/\/$/, '')
      clean_url = url.gsub(/^\//, '').gsub(/\/$/, '')
      
      clean_permalink == clean_url
    end
  end
end 