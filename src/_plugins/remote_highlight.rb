require 'net/http'

module Jekyll

  class RemoteHighlight < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      url = markup.gsub(/\A[[:space:]]+|[[:space:]]+\z/, '')

      if url =~ URI::regexp
        @content = "<pre data-src=\"%s\"
                        data-download-link
                        data-download-link-label=\"Download this file\"
                        class=\"line-numbers\"></pre>" % url
      else
        raise 'Invalid URL passed to RemoteHighlight'
      end

      super
    end

    def render(context)
      if @content
        @content
      else
        raise 'Something went wrong in RemoteHighlight'
      end
    end

  end
end

Liquid::Template.register_tag('rhighlight', Jekyll::RemoteHighlight)
