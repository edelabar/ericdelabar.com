module Jekyll
  class AppCacheConverter < MarkdownConverter
    safe true

    priority :low

    def matches(ext)
      ext =~ /appcache/i
    end 

    def output_ext(ext)
      ".appcache"
    end
    
  end
end

class AppcacheVersionTag < Liquid::Tag
  def initialize(tag_name, name, tokens)
    super
  end
  
  def render(context)
    Jekyll::VERSIONS['manifest']
  end  
end

Liquid::Template.register_tag('appcache_version', AppcacheVersionTag)

class AppcacheFileVersionTag < Liquid::Tag
  def initialize(tag_name, name, tokens)
    super
    @file = name.to_s.strip
    @base = @file.split('/').last.split('.').first
    @extension = @file.split('.').last
    if Jekyll::ENV == 'production'
      @path = 'min'
    else
      @path = @extension
    end
  end
  
  def render(context)
    "/#{@path}/#{@base}.#{Jekyll::VERSIONS[@base]}.#{@extension}"
  end  
end

Liquid::Template.register_tag('appcache_file', AppcacheFileVersionTag)