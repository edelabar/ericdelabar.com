module Jekyll
  module SlugifyFilter
    def slugify(input)
      input.gsub(/\./, '').gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlugifyFilter)