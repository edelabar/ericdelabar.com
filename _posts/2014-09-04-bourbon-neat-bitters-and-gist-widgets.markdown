---
layout: post
title: Fixing the Gist Embed Widget when Using Bourbon, Neat, and Bitters
metadesc: How to quickly fix the display of gists when starting with the thoughtbot Sass frameworks
class: post
changefreq: never
priority: 0.9
categories: [css, github, gist, bourbon, neat, bitters, sass]
---

As an avid user of [Gist](https://gist.github.com/edelabar/696b2ed5026d3cb1a0fb) embeds, when I added the [thoughtbot](http://thoughtbot.com/) [Sass](http://sass-lang.com/) frameworks [Bourbon](http://bourbon.io/), [Neat](http://neat.bourbon.io/), and [Bitters](http://bitters.bourbon.io/) to this site, I was a bit disappointed when the widget display was a bit broken:

<a href="https://gist.github.com/edelabar/696b2ed5026d3cb1a0fb"><img src="/img/content/broken-gist.png" alt="Incorrectly-rendered gist embed." border="0" width="740" height="207" id="img_broken-gist" class="clear"></a>

A bit of debugging and I found that the culprit was `table-layout: fixed`, which was included by Bitters. A quick patch in my `main.scss` file and we were all fixed: (As you can see by this working gist!) 

{% render_gist https://gist.github.com/edelabar/696b2ed5026d3cb1a0fb/raw/3a88f65927ccfba991a9be5a8a1432df7a22571f/bourbon-neat-bitters-and-gist-widgets.css %}

Hope it helps somebody else.  If you'd like to use progressively-enhanced Gist embeds in [Jekyll](http://jekyllrb.com/) like this site, check out my [jekyll-gist-tag on Github](https://github.com/edelabar/jekyll-gist-tag)! (Turn off javascript to see what this does.)