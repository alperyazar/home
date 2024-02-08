module Jekyll
    class RenderAsciicastSelfTag < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super
        @text = text.strip
      end

      def render(context)
        "<link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/css/asciinema-player.css\" />" \
        "<div id=\"cast-#{@text}\"></div>" \
        '<script src="/assets/js/asciinema-player.min.js"></script>' \
        "<script>AsciinemaPlayer.create('/assets/asciicasts/#{@text}.cast', document.getElementById('cast-#{@text}'), {autoPlay: false});</script>"
      end
    end
  end

  Liquid::Template.register_tag('asciicastself', Jekyll::RenderAsciicastSelfTag)
