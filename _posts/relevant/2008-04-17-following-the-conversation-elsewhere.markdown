---
layout: post
title: Following The Conversation Elsewhere by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Following The Conversation Elsewhere

A few days ago [I commented on this post over at Publishing 2.0](http://publishing2.com/2008/04/12/forget-disintermediation-focus-on-open-data-exchange/#comment-403019), 
ignoring the semantic debate of whether the article described intermediation or disintermediation, I came up with 
an idea that I personally find very interesting.  I touched on this idea on 
[Tuesday's post](/2008/04/online-identity-and-the-social-graph.html) when I said:

> How about blog and forum comments, it would be great to have an authenticated and decentralized means of 
> establishing me on a site that is not my own. It would be even better if I could then aggregate these comments 
> into my own site to track my current conversations in the blogosphere.

In that article I relied on Google to crawl the site and provide the aggregation for me, what if we looked at it 
more like my Publishing 2.0 comment and provided a reverse trackback ping.

In order for this to really work, we need a few things, one, we need a service that accepts the ping; Wordpress accepts 
[trackback pings](http://en.wikipedia.org/wiki/Trackback), so let's assume this is easy to implement. 
Since most blog comment systems accept a blog URL, we know the author's URL, append to that a well known 
URI to accept the ping and we now have an endpoint.  So far, so good.  Next, we need identity, 
in order for this to work people cannot be able to spam the system, we need a pretty solid concept of identity.  To borrow 
from [MicroID](http://microid.org/), URL + email = identity, since most (if not all) 
blog comments accept email and don't show it, we can create a MicroID hash and add it to the comment's container element 
as a class according to the [Microformat class pattern](http://microformats.org/wiki/class-design-pattern).  
Finally, once the comment is approved and posted, the blog pings the commenter's blog with the generated MicroID and the 
post URL, the commenter's blog visits the site and extracts the comment via the MicroID class, 
and adds it to the feed of current conversations.

I like the concept, only one problem, it requires both the client and server to understand this reverse trackback ping. 
If we lived in a Wordpress-only world this would be pretty simple, one plug-in, or better yet a change to the code base, 
and the functionality is there.  I've also considered a JavaScript bug placed in the post by the author who's blog contains 
an endpoint, but javascript and comments probably don't mix well, and we really only need a ping the first time not every 
time the page is loaded.  Another option would be the manual approach, telling your own blog to go crawl the blog you've 
just posted on for your comments; or possibly even a third-party service that just crawls blogs looking for MicroID classes 
and then publishes the results as a feed that a commenter's blog can consume.  Manual is pretty much overkill, it would probably 
be easier to just create a new post and copy and paste the comments.  The third party service just means one more service silo 
and eliminates the control of your own identity because now the content is stored there, as well as the problem of having to 
rely on a third party to spider the blog before your content gets updated.  So there's the impasse, a logical idea without a 
practical application.

For now, my first Wordpress plug-in is going to be an experiment to see if this works, and then we'll move on from there, 
unless of course [Chi.mp](http://chi.mp/) is moving in that direction, then I guess we'll just have to see what 
they come up with.

