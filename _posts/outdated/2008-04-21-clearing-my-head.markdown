---
layout: post
title: Clearing My &lt;head&gt; by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
<h1>Clearing My <code>&lt;head&gt;</code></h1>
<p>It always struck me as odd, but I originally had three types of feeds on this site, <a href="http://en.wikipedia.org/wiki/Atom_(standard)">Atom</a>, <a href="http://en.wikipedia.org/wiki/Rss"><span class="caps">RSS</span> 0.93, and <span class="caps">RSS</span> 2</a>, this is accomplished quite simply with the following code block in&nbsp;WordPress:</p>

{% render_gist https://gist.github.com/raw/885077/f2644cb5a5e8ed94544dbc0fe38777ab77a5719a/clearing-my-head.php %}

<p>That code was only really there because the theme I used as my base had it, so I kept it without thinking.  I run my feed through Feedburner, <a href="http://blogs.feedburner.com/feedburner/archives/000520.html">which has a feature that is supposed to provide the format that your reader can read</a>, assumably making multiple feed definitions unnecessary.  I'm not sure how that works, or if it works with the <a href="http://www.google.com/support/feedburner/bin/answer.py?answer=78483&amp;topic=13252">Feedburner plug-in for WordPress</a>, but it's turned on in my Feedburner&nbsp;account.</p>
<p>While hacking feeds out of my <code>head</code> I chose to keep the RSS 2.0 feed because WordPress seems to favor it based on URL structure; with RSS 2.0 being <code>/feed</code> and RSS .92 and ATOM being <code>/feed/rss</code> and <code>/feed/atom</code> respectively.  With that answered, I suppose the next question is "why?"  Well, mainly because of <a href="http://textism.com/2008/04/19/please.stop.doing.this">this article by Dean Allen over at Textism</a>.  It just makes sense, and from a usability standpoint, the easier to subscribe to my feed the better!  Less choices equals easier to use, so maybe this will help my subscription numbers if people can subscribe without&nbsp;thinking.</p>
<p>With that being said, <a href="/2008/04/fixing-the-serps-when-changing-permalink-structure.html">I initially 301 redirected the other two feed URLs to the</a> <a href="/fees"><span class="caps">RSS</span> 2 <span class="caps">URL</span></a> <a href="/2008/04/fixing-the-serps-when-changing-permalink-structure.html">using the technique described in this post</a>, which I'm assume should work perfectly, but I'm guessing that is unnecessary, since the URLs themselves will continue to function thanks to WordPress' default behavior, so I took the redirects out.  If anybody has any problems accessing the feed, or thinks my methodology should change, please enlighten me with a comment to this&nbsp;post.</p>