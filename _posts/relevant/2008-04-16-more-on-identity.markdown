---
layout: post
title: More On Identity by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>More On Identity</h1>
<p>First things first, three new entries to the Blogroll: <a href="http://bokardo.com/">Bokardo</a>, <a href="http://www.brianoberkirch.com/">Like It Matters</a>, and <a href="http://www.ownyouridentity.com/">Own Your Identity</a>.  I've been a long-time <a href="http://bokardo.com/">Bokardo</a> reader, and the other two entries came from that.  <a href="http://bokardo.com/">Josh Porter from Bokardo</a> is a contributer to <a href="http://www.ownyouridentity.com/">Own Your Identity</a>, which is also contributed to by <a href="http://www.brianoberkirch.com/">Brian Oberkirch of Like It Matters</a> and <a href="http://mylermedia.com/">Myles Weissleder</a>.  <a href="http://www.ownyouridentity.com/">Own Your Identity</a> is the blog for the <a href="http://chi.mp/">Ch.imp (Content Hub and Identity Management Platform) project</a>, which is <a href="http://www.ownyouridentity.com/2008/03/16/feudalism-20-or-serfing-the-web/">described in this post</a>.  I love the concept, a decentralized identity hub that you install on your own&nbsp;domain.</p>
<p>I also came across <a href="http://blog.claimid.com/">ClaimID</a>, a blog on managing your online identity, which lead me to <a href="http://microid.org/">MicroID</a>, which seems like a <a href="http://microformats.org/">microformat</a>-based cross between <a href="http://xmlns.com/foaf/spec/#term_mbox_sha1sum"><span class="caps">FOAF</span>'s <code>foaf:mbox_sha1sum</code></a> and an inverted <span class="caps">XFN</span> <code>rel="me"</code>, in other words you place a <code>meta</code> element on pages that you own with a hash generated from your online identity (consisting of email and url), which looks something like&nbsp;this:</p>

{% render_gist https://gist.github.com/raw/885488/66ae06e1b161e01d6efa7f21530e3bffa12d06bb/more-on-identity.html %}

<p>I'm not 100% sold yet and I think I'm missing some of the details, but I'm interested, and I've added it to my <code>head</code>&nbsp;element.</p>
