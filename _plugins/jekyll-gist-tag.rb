require 'net/https'  
 
module Jekyll
  class RenderGist< Liquid::Tag

    def initialize(tag_name, url, tokens)
      super
      
      tokens = url.split(' ')
      @url = tokens[0]
      lang = tokens[1]
      
      /https:\/\/gist.github.com\/raw\/(.*)\/.*\/(.*\.([a-zA-Z]+))/ =~ @url
      @gist = $1
      @file = $2
      @lang = $3
      
      if lang != nil && !lang.empty?
        @lang = lang
      end
      
      host = 'gist.github.com'
      path = "/raw/#{@gist}/#{@file}"

      http = Net::HTTP.new(host, 443)
      http.use_ssl = true
      headers, body = http.get(path)
      if headers.code == "200" 
        @code = body                         
      end
      
    end
    
    def render(context)
      if context.registers[:site].pygments
        render_pygments(context, @code, @lang)
      end
    end

    def render_pygments(context, code, lang)
      output = add_code_tags(Albino.new(code, lang).to_s, lang)
      output = context["pygments_prefix"] + output if context["pygments_prefix"]
      output = output + context["pygments_suffix"] if context["pygments_suffix"]
      output
    end

    def add_code_tags(code, lang)
      # Add nested <code> tags to code blocks
      code = code.sub(/<pre>/,"<div class=\"code\"><script src=\"https://gist.github.com/#{@gist}.js?file=#{@file}\"></script><noscript><pre><code class=\"#{lang}\">\n")
      code = code.sub(/<\/pre>/,"</code></pre><p><a href=\"https://gist.github.com/#{@gist}\">This Gist</a> hosted on <a href=\"http://github.com/\">GitHub</a>.</p></noscript></div>")
    end
    
  end
end

Liquid::Template.register_tag('render_gist', Jekyll::RenderGist)