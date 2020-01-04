---
layout: page
title: All Categories
metadesc: The list of all categories for EricDeLabar.com posts.
class: categories
changefreq: monthly
priority: 0.1
---
<ul class="tag-box inline">
{% assign tags_list = site.categories %}  
  {% if tags_list.first[0] == null %}
    {% for tag in tags_list %} 
      <li class="cat-{{ tag | slugify }}"><a href="{{ tag | slugify }}/">{{ tag | capitalize }} <span>({{ site.tags[tag].size }})</span></a></li>
    {% endfor %}
  {% else %}
    {% for tag in tags_list %} 
      <li class="cat-{{ tag[0] | slugify }}"><a href="{{ tag[0] | slugify }}/">{{ tag[0] | capitalize }} <span>({{ tag[1].size }})</span></a></li>
    {% endfor %}
  {% endif %}
{% assign tags_list = nil %}
</ul>