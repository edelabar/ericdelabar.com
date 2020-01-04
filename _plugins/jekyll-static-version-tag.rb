# Modified from http://mikeferrier.com/2011/04/29/blogging-with-jekyll-haml-sass-and-jammit/
class AssetTag < Liquid::Tag
  
  def initialize(tag_name, name, kind, tokens)
    super tag_name, name, tokens
    @name   = name.to_s.strip
    @kind   = kind.to_s
  end

  def render(context)
    markup "/#{@path}/#{@name}.#{self.version}.#{@ext}"
  end
  
  def filename
    "#{@path}/#{@name}.#{@ext}"
  end
  
  def version
  	File.mtime(self.filename).strftime("%Y%m%d%H%M%S")
  end
    
  def last_modified_file(dir, ext=nil)
    ext='.'<<ext unless ext.nil? or ext[0,1]=='.'
    Dir["#{dir}**/*#{ext}"].sort_by {|p|
      File.mtime(p)
    }.last
  end

  # Which of the two dates is later
  #
  # Returns latest of two date
  def greater_date(date1, date2)
    if (date1 >= date2) 
      date1
    else 
      date2      
    end
  end
  
end



class IncludeJsTag < AssetTag

  def initialize(tag_name, name, tokens)
    @path = 'js'
    @ext = 'js'
    super tag_name, name, 'js', tokens
  end
  
  def markup(src)
    %{<script defer src="#{src}"></script>}.to_s
  end  
  
end

Liquid::Template.register_tag('include_js', IncludeJsTag)



class IncludeScssTag < AssetTag

  def initialize(tag_name, name, tokens)
    @path = 'css'
    @ext = 'css'
    super tag_name, name, 'css', tokens
  end
  
  def filename
    "#{@path}/#{@name}.scss"
  end
  
  def markup(src)
    %{<link rel="stylesheet" href="#{src}">}.to_s
  end
  
  def version
  	partialsLastModified = File.mtime(self.last_modified_file('_sass/', '.scss'))
  	fileLastModified = File.mtime(self.filename)
  	self.greater_date(fileLastModified, partialsLastModified).strftime("%Y%m%d%H%M%S")
  end
  
end

Liquid::Template.register_tag('include_scss', IncludeScssTag)