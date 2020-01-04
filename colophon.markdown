---
layout: page
title: Colophon
metadesc: A little bit about EricDeLabar.com and the software and design behind it.
class: colophon
changefreq: yearly
priority: 0.7
---
This site was built on a Mac using [Coda 2](https://panic.com/coda/) and [TextMate](http://macromates.com/), it's statically-generated with [Jekyll](http://jekyllrb.com/), and it’s all hosted on [Dreamhost](http://www.dreamhost.com/r.cgi?146279). I don't have comments anymore because it's a static site, maybe one day I'll fix that, but for now if you'd like to comment or reply post it somewhere else and send me the link.  If it furthers the conversation I'll gladly link back.

I use the following Jekyll plugins to make things work:

* [PayPal Donation Liquid tag](https://github.com/ttscoff/JekyllPlugins/tree/master/Donation) - Creates the Donate button on the [About](/about.html) page.
* [jekyll-gist-tag](https://github.com/edelabar/jekyll-gist-tag) - By yours truly, pulls code samples from gists in a gracefully-degrading way.  Why?  Because I love web standards and this stuff should work without Javascript.
* [jekyll-sitemap-tag](https://github.com/edelabar/jekyll-sitemap-tag) - Also by yours truly, generates a nice, [nested HTML sitemap](/sitemap.html) for a Jekyll site.  Why?  Because it's good SEO/usability, or at least it used to be, and I'm a little anal.
* [jekyll-static-version-tag](https://github.com/edelabar/jekyll-static-version-tag) - Again, by yours truly, creates versioned .js and .css html tags so that you can use far-future expires headers per PageSpeed best practices.  Caching FTW!
* [jekyll-plugins](https://github.com/edelabar/jekyll-plugins) - Forked from [kinnetica/jekyll-plugins](https://github.com/kinnetica/jekyll-plugins), used to generate archive pages to match my old Wordpress URL structure and generate a sitemap.xml file.
* [jekyll-temporal-archive-generator](https://github.com/edelabar/jekyll-temporal-archive-generator) - Last one by yours truly, this one finishes off the the missing WordPress URLs that jekyll-plugins didn't generate.

I also have [Sass](http://sass-lang.com/) running with [Bourbon](http://bourbon.io/), [Neat](http://neat.bourbon.io/), and [Bitters](http://bitters.bourbon.io/) to generate the css file (although I'm not really using them yet), and as you can probably tell from the favicon, it all started out with [HTML5 Boilerplate](http://html5boilerplate.com/).  (I swear I'll change the icon eventually....)