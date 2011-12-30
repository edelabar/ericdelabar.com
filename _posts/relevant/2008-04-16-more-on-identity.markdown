---
layout: post
title: More On Identity by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# More On Identity

First things first, three new entries to the Blogroll: [Bokardo](http://bokardo.com/), 
[Like It Matters](http://www.brianoberkirch.com/), and 
[Own Your Identity](http://www.ownyouridentity.com/).  I've been a long-time 
[Bokardo](http://bokardo.com/) reader, and the other two entries came from that. 
[Josh Porter from Bokardo](http://bokardo.com/) is a contributor to 
[Own Your Identity](http://www.ownyouridentity.com/), which is also contributed to by 
[Brian Oberkirch of Like It Matters](http://www.brianoberkirch.com/) and 
[Myles Weissleder](http://mylermedia.com/). 
[Own Your Identity](http://www.ownyouridentity.com/) is the blog for the 
[Ch.imp (Content Hub and Identity Management Platform) project](http://chi.mp/), which is 
[described in this post](http://www.ownyouridentity.com/2008/03/16/feudalism-20-or-serfing-the-web/). 
I love the concept, a decentralized identity hub that you install on your own domain.

I also came across [ClaimID](http://blog.claimid.com/), a blog on managing your online identity, 
which lead me to [MicroID](http://microid.org/), which seems like a 
[microformat](http://microformats.org/)-based cross between 
[FOAF's `foaf:mbox_sha1sum`](http://xmlns.com/foaf/spec/#term_mbox_sha1sum) 
and an inverted XFN `rel="me"`, in other words you place a 
`meta` element on pages that you own with a hash generated from your online identity (consisting of email and url), 
which looks something like this:

{% render_gist https://gist.github.com/raw/885488/66ae06e1b161e01d6efa7f21530e3bffa12d06bb/more-on-identity.html %}

I'm not 100% sold yet and I think I'm missing some of the details, but I'm interested, and I've added it to my 
`head` element.

