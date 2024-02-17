module Jekyll
  class ValidatePostsGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      axseq_tracker = Hash.new { |hash, key| hash[key] = [] }

      site.posts.docs.each do |post|
        validate_axseq(post)
        validate_tags(post)
        validate_unique_year_axseq(post, axseq_tracker)
      end
    end

    private

    def validate_axseq(post)
      axseq = post.data['axseq']
      unless axseq.is_a?(Integer) && axseq > 0
        raise "Post '#{post.data['title']}' has an invalid 'axseq' value. It must be a non-zero positive integer."
      end
    end

    def validate_tags(post)
      tags = post.data['tags'] || []
      has_en = tags.include?('en')
      has_tr = tags.include?('tr')

      if has_en && has_tr
        raise "Post '#{post.data['title']}' cannot have both 'en' and 'tr' tags."
      elsif !has_en && !has_tr
        raise "Post '#{post.data['title']}' must have at least one 'en' or 'tr' tag."
      end
    end

    def validate_unique_year_axseq(post, axseq_tracker)
      year = post.data['date'].year
      axseq = post.data['axseq']

      if axseq_tracker[year].include?(axseq)
        raise "Post '#{post.data['title']}' has a duplicate 'axseq' value (#{axseq}) for the year #{year}. Each 'Year-axseq' pair must be unique."
      else
        axseq_tracker[year] << axseq
      end
    end
  end
end
