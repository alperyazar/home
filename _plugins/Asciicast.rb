module Jekyll
    class RenderAsciicastTag < Liquid::Tag
  
      def initialize(tag_name, text, tokens)
        super
        @text = text.strip
      end
  
      def render(context)
        "<script async id=\"asciicast-#{@text}\" src=\"https://asciinema.org/a/#{@text}.js\"></script>"
      end
    end
  end
  
  Liquid::Template.register_tag('asciicast', Jekyll::RenderAsciicastTag)
  