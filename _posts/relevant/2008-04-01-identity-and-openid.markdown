---
layout: post
title: Identity and OpenId by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Identity and OpenId

It all started last week when I read 
[an article on Vitamin about the launch of ClickPass at SxSW](http://www.thinkvitamin.com/features/webapps/the-thrill-of-launch). 
I'd noticed [OpenID](http://en.wikipedia.org/wiki/OpenID) before, mainly on the 
[Ma.gnolia](http://ma.gnolia.com/) login page, but I never really saw a reason to 
get one for a single site.  Today, I finally decided to check it out.

I started at [ClickPass](http://www.clickpass.com/home), which lead me to 
[OpenID.net](http://openid.net/), which listed a page containing 
[all of the OpenIds that I already have](http://openid.net/get/).  Not really 
wanting to tie myself to a particular web app, I choose [myOpenID](https://www.myopenid.com/) 
because I liked the logo.  I quickly created an account, then noticed that you could get a 
myOpenID for a domain, since I own <a href="http://delabar.org/" rel="me">delabar.org</a>, 
[openid.delabar.org](http://openid.delabar.org/) was born.  After some quick 
configuration, I had <a href="http://openid.delabar.org/eric" rel="me">my open personal OpenID</a> 
that was easy for me to remember and ready to use.  Very cool.

Looking into the topic further, I found 
[Sam Ruby's instructions for setting up OpenId without using a service](http://www.intertwingly.net/blog/2007/01/03/OpenID-for-non-SuperUsers), 
interesting from a privacy perspective since you're in complete control of your information, but 
at the same time you lose the third party verifying your identity.  Leaving that debate for another 
day, the best part of the post was the first section where Sam talks about using delegation to claim 
your blog.  With a simple block of code in your html head, something like the following, you can use 
your blog as your OpenID.

{% render_gist https://gist.github.com/raw/885170/7c6d142e1bfa29e0143a227c991497637b63636b/identity-and-openid.html %}

Using this [quick test](http://www.openidenabled.com/resources/openid-test/checkup) I verified 
this, and I can now use my blog URL as my OpenID.  Now, what is my reason for 
doing that?  I really don't have one, since I'm already using my own domain as my OpenID. However, if 
I was using some other OpenID, like [my Flickr URL](http://www.flickr.com/photos/ericdelabar" rel="me) 
for example, I would have a level of redirection that would allow me to swap 
<a href="http://www.flickr.com/photos/ericdelabar" rel="me">Flickr</a> out for 
<a href="http://www.technorati.com/people/technorati/edelabar" rel="me">Technorati</a> without having to 
go and re-authenticate at all of my sites that use OpenID.  Now, let's bring in the 
[Social Graph](http://code.google.com/apis/socialgraph/), a quick bit of 
[XFN](http://gmpg.org/xfn/) code in my link above, and now my OpenID 
identification page is part of my social graph.
