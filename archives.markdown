---
layout: home
title: Eric DeLabar Archives
metadesc: Articles and blog posts I've written on previous versions of this website, mostly outdated but kept for posterity and the permalink promise.
class: archives
---
# Archives
<p>A permalink is a promise, so this content must live forever, or as long as I can afford the hosting bills.  The good stuff's at the top, please give it a read!</p>

<h2>Worth a Read...</h2>
<p>These articles are timeless, interesting, or at least not too embarrasing.</p>

<ol>
	{% for post in site.posts %} 
		{% if post.category == "relevant"%}
		<li> 
			<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
			<p><strong>Originally Published:</strong> <abbr class="updated" title="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: '%B %d, %Y' }}</abbr></p>
		</li> 
		{% endif %}
	{% endfor %}
</ol>

<h2>Just Skip It...</h2>
<p>I've grown up a bit and learned a lot since this blog was started.  In the beginning I took tips from the likes of John Chow and Shoemoney and tried to write titles and content for Digg and Reddit.  In the end it didn't do me much good and most of it just seems silly looking back, but if you're interested anyway, here's what I wrote.</p>

<ol>
	{% for post in site.posts %} 
		{% if post.category == "outdated"%}
		<li> 
			<h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
			<p><strong>Originally Published:</strong> <abbr class="updated" title="{{ post.date | date: '%Y-%m-%d' }}">{{ post.date | date: '%B %d, %Y' }}</abbr></p>
		</li> 
		{% endif %}
	{% endfor %}
</ol>