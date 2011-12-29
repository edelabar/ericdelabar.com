---
layout: post
title: Progressive Enhancement and LightWindow by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Progressive Enhancement and LightWindow

Nothing says Web 2.0 like a lightbox, those nifty, little, modal dialogs that let you create pop-up-like functionality 
without the worry of pop-up blockers.  There are quite a few variations of this concept, including 
[Lightbox JS](http://www.huddletogether.com/projects/lightbox/) 
(and its many variants including [Lightbox Gone Wild](http://particletree.com/features/lightbox-gone-wild/) 
by [Wufoo](http://particletree.com/">the makers of</a> <a href="http://wufoo.com/)), 
[Slimbox](http://www.digitalia.be/software/slimbox), and my personal favorite 
[LightWindow](http://www.stickmanlabs.com/lightwindow/).  In general, they're all pretty 
[unobtrusive](http://en.wikipedia.org/wiki/Unobtrusive_JavaScript), but in this little tutorial I'm going 
to kick up the [progressive enhancement](http://en.wikipedia.org/wiki/Progressive_Enhancement) a notch and 
make LightWindow even better!

Let's start with a client who wants to use a lightbox to display a multi-view image viewer for an e-commerce site. 
In true progressive enhancement fashion, if JavaScript is disabled, *the user should still be able to perform the basic functionality of the site*.  So, let's assume our site has a simple layout with a header, a footer, and a 
main content area that [looks something like this](http://www.ericdelabar.com/examples/progressive-enhancement-lightwindow/). 
When JavaScript is disabled the image viewer should show up with the header and footer, when it's enabled, it should 
show up in a lightbox without the header and footer.  So how do we do it?

LightWindow can be used to display any given webpage by simply setting the class of a link to that webpage to 
`lightwindow`.  Simple enough.  When the lightwindow.js file loads it searches your document for anchor 
elements with a class of `lightwindow` and adds the necessary 
`onclick` handler to make the 
link open in a lightbox instead of as a normal page, as unobtrusive as it gets.  However, since we want our result 
page to look differently depending on whether it's being displayed as a lightwindow or a regular page, we need some 
way to tell our back-end the display form-factor.  To accomplish that we'll add my own little progressive enhancement 
to the page.

{% render_gist https://gist.github.com/raw/885496/a5c1f29a62a7145f7e45813ed168c5076d0d5e0b/progressive-enhancement-lightwindow.js %}

This is simple enough [prototype.js](http://prototypejs.org/) JavaScript code that crawls the 
<acronym title="Document Object Model">DOM</acronym> for elements with a class set to 
lightwindow and adds a parameter of `lightwindow=true` to the `href` attribute.  With this 
parameter in place, the back-end now knows which form-factor to use when rendering the page and we can accomplish our 
goal with some simple [PHP](http://www.php.net/) code. (Pardon my PHP, I'm by no means a PHP expert, this is only meant to be a simple example.):

{% render_gist https://gist.github.com/raw/885496/59ccc0128f30ba6f5d00ce67d62e9054a1e6930b/progressive-enhancement-lightwindow.php %}

Problem solved, [have a look here and click on the "this link" link](http://www.ericdelabar.com/examples/progressive-enhancement-lightwindow/).  
Of course there are a few more programming alternative along these lines, including 
modifying the LightWindow object at runtime to prevent a second crawl of the DOM for elements 
with the `lightwindow` class, theoretically improving performance, but I'm going to leave that for another article.

As an interesting side benefit to this technique, web crawlers like the [Googlebot](http://en.wikipedia.org/wiki/Googlebot), 
which don't interpret JavaScript, will follow the link to the lightbox page and receive a full page as opposed to just the page 
content. This Allows the robot to continue crawling your site through the navigation and also allows it to see your page title 
and meta tags.  Now, just a little forewarning, be careful with this technique, if you abuse it, it may be considered 
[cloaking](http://en.wikipedia.org/wiki/Cloaking) any you could have your site delisted for violating the 
[webmaster guidelines](http://www.google.com/support/webmasters/bin/answer.py?hl=en&amp;answer=35769).  So in other 
words, use this technique to provide context and don't try and stuff the pages with keywords or do anything underhanded.
