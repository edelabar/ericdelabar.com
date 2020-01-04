---
layout: post
title: Let's talk about tools &ndash; Part 1
metadesc: 
class: post
changefreq: never
priority: 0.9
categories: [relevant, firefox extensions, tools]
---
After my [last post](http://blog.ericdelabar.com/2007/02/in-beginning-there-was-doctype.html "In the beginning there was DOCTYPE"), 
we have a nice, clean starting point for our website.  Which is great, but in order to take it to the next level, 
we should probably get a nice development environment up and running.

First, we'll start with the client side. At my employer, we develop entirely on Windows.  In my spare time, I 
have a [Gentoo](http://www.gentoo.org/) (soon to be 
[Ubuntu](http://www.ubuntu.com/)) Linux 
box at home. Because of these factors, my tools of choice tend to be cross platform.  As far as browsers go, I 
develop strictly in Firefox due to its ease of debugging with tons of useful plug-ins 
([Firebug](http://www.getfirebug.com/), 
[Web Developer Toolbar](http://chrispederick.com/work/webdeveloper/), 
DOM Inspector) and cross-platform availability.  I of course have IE at work; where I've switched totally to IE 7, and I run the 
[free IE 6 <acronym title="Virtual Machine VM</acronym> provided by Microsoft](http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx) 
for testing in IE 6.  I also have access to a Mac running 
[Safari](http://en.wikipedia.org/wiki/Safari_%28web_browser%29), a variety of Windows Mobile smart phones, 
and a few versions of [Opera](http://en.wikipedia.org/wiki/Opera_(web_browser)), including the Wii Beta version. 
Do I cover all of my bases?  Probably not, but I'm at least over 95% of the user base.

What I really want to talk about are the [Firefox plug-ins](https://addons.mozilla.org/firefox/extensions/) 
I mentioned earlier; if these tools are used correctly, a properly coded site that works in Firefox works just about 
everywhere else as well.  To start off, make sure that when you first install Firefox, the DOM 
Inspector is installed. To do this, on the "Setup Type" screen, choose Custom, and on the "Choose Optional Components" 
screen, make sure the "DOM Inspector" check box is checked:

<img src="/img/content/custom.gif" alt="custom.gif" border="0" width="502" height="386" id="img_custom" class="clear">

Choose Optional Components...

<img src="/img/content/dom-inspector.gif" alt="dom_inspector.gif" border="0" width="503" height="386" id="img_inspector" class="clear">

Install DOM Inspector...

Ok, now we're ready for plugins!  My current must haves are as follows:

* [Web Developer Toolbar](https://addons.mozilla.org/firefox/60/) -- Tons of useful little tools that no web developer 
should be without.  Just install it and play with it.  Trust me.
* [Firebug](https://addons.mozilla.org/firefox/1843/) -- Amazing debugging and profiling tools, plus the Inspect button 
which lets you see which CSS rules apply to any element in your doc, and a fancy colored overlay showing 
element, margin and padding.
* [MeasureIt](https://addons.mozilla.org/firefox/539/) -- Great tool for pixel-perfect measuring!
* [ColorZilla](https://addons.mozilla.org/firefox/271/) -- Quickly grab colors without viewing page source.
* [HTML Validator](https://addons.mozilla.org/firefox/249/) -- W3C 
Validation on the fly, and in your view-source window.
* [View Source Chart](https://addons.mozilla.org/firefox/655/) -- Great for dealing with tag-soup or server generated 
code that's not nicely tabbed or spaced.
* [Operator](https://addons.mozilla.org/firefox/4106/) -- A must have for developing with (and using) 
[Microformats](http://microformats.org/).
* [Tails](http://blog.codeeg.com/tails-firefox-extension-03/) -- Another must have for developing with 
(and using) [Microformats](http://microformats.org/).

If you're still stuck in IE land, there's still hope, Microsoft has released a half-decent 
copycat Web Developer Toolbar, and there's hope for their [(Java)Script debugger](http://www.microsoft.com/downloads/details.aspx?FamilyID=2f465be0-94fd-4569-b3c4-dffdf19ccd99&amp;DisplayLang=en). 
If you have a Genuine Advantage copy of Windows it won't hurt to try them out.

That's it!  Get those installed, play with them, and tune in next time for [part 2](http://blog.ericdelabar.com/2007/03/lets-talk-about-tools-part-2.html "Let's talk about tools &ndash; Part 2"), 
where we setup [Eclipse](http://www.eclipse.org/) and [Apache](http://httpd.apache.org/) as a test web server on Windows.
