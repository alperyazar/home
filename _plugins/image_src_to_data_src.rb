Jekyll::Hooks.register :posts, :post_render do |post|
  original_output = post.output.dup # Make a copy of the original output for comparison
  modified_images = [] # Initialize an array to keep track of modified images

  # Use a non-greedy match to find <img> tags, then process each tag individually
  post.output = post.output.gsub(/<img(.*?)\/?>/i) do |match|
    img_tag = match
    # Check if the "lazyload" class is within the class attribute of the tag
    if img_tag =~ /class=".*?\blazyload\b.*?"/
      # Extract the src attribute value
      src = img_tag[/src="(.*?)"/, 1]
      # Add the src to the list of modified images
      modified_images << src unless src.nil?
      # Replace or add the lazy loading attributes
      img_tag.sub!(/src="(.*?)"/, 'data-srcset="\1" srcset="/assets/lazyload.png" src="\1"')
    end
    # Return the modified or original img tag
    img_tag
  end

  # Check if any replacement was made and print details
  unless modified_images.empty?
    puts "Modified image tags in post: #{post.data['title'] || 'no title'}"
    modified_images.each do |src|
      puts " - Modified image: #{src}"
    end
  else
    puts "No image tags modified in post: #{post.data['title'] || 'no title'}"
  end
end
