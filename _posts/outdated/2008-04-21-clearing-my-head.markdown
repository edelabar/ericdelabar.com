---
layout: post
title: Clearing My &lt;head&gt; by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
# Clearing My ``&lt;head&gt;`

It always struck me as odd, but I originally had three types of feeds on this site, 
[Atom](http://en.wikipedia.org/wiki/Atom_(standard)), 
[RSS 0.93, and RSS 2](http://en.wikipedia.org/wiki/Rss), 
this is accomplished quite simply with the following code block in WordPress:

{% render_gist https://gist.github.com/raw/885077/f2644cb5a5e8ed94544dbc0fe38777ab77a5719a/clearing-my-head.php %}

That code was only really there because the theme I used as my base had it, so I kept 
it without thinking.  I run my feed through Feedburner, 
[which has a feature that is supposed to provide the format that your reader can read](http://blogs.feedburner.com/feedburner/archives/000520.html), 
assumably making multiple feed definitions unnecessary.  I'm not sure how that works, or if it works with the 
[Feedburner plug-in for WordPress](http://www.google.com/support/feedburner/bin/answer.py?answer=78483&amp;topic=13252), 
but it's turned on in my Feedburner account.

While hacking feeds out of my `head` I chose to keep the RSS 2.0 feed because 
WordPress seems to favor it based on URL structure; with RSS 2.0 being `/feed` and RSS .92 and ATOM being 
`/feed/rss` and 
`/feed/atom` respectively.  With that answered, I suppose the next question is 
"why?"  Well, mainly because of [this article by Dean Allen over at Textism](http://textism.com/2008/04/19/please.stop.doing.this).  
It just makes sense, and from a usability standpoint, the easier to subscribe to my feed the better!  Less choices 
equals easier to use, so maybe this will help my subscription numbers if people can subscribe without thinking.

With that being said, [I initially 301 redirected the other two feed URLs to the](/2008/04/fixing-the-serps-when-changing-permalink-structure.html) 
[RSS 2 URL](/fees) 
[using the technique described in this post](/2008/04/fixing-the-serps-when-changing-permalink-structure.html), 
which I'm assume should work perfectly, but I'm guessing that is unnecessary, since the URLs themselves will continue to 
function thanks to WordPress' default behavior, so I took the redirects out.  If anybody has any problems accessing the feed, 
or thinks my methodology should change, please enlighten me with a comment to this post.
