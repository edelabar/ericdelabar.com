---
layout: post
title: Gridding the Semantic Web by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Gridding the Semantic Web

To continue the discussion on the design of this blog, I'm going to take a moment and step onto my 
soapbox.  But first, a brief introduction to the topic at hand.

I think I noticed this whole grid revolution back in 
[December 2006 when Cameron Moll mentioned it in his article Gridding the 960](http://cameronmoll.com/archives/2006/12/gridding_the_960/), 
based on [the *optimal* layout width for a 1024px wide screen](http://www.cameronmoll.com/archives/001220.html). 
I was interested, and sites designed using a grid seemed pretty sharp, so I added it to ma.gnolia and moved on.  A few months 
later I caught [an article on ALA about the baseline grid](http://www.alistapart.com/articles/settingtypeontheweb/), 
a post to [24-ways](http://24ways.org/) about 
[vertical rhythm](http://24ways.org/2006/compose-to-a-vertical-rhythm), and after that a nice 
[7-step guide to creating a grid-based design](http://www.sachagreif.com/blog/seven-smooth-steps-to-superb-grids/), 
and a great piece on [incremental leading](http://www.markboulton.co.uk/journal/comments/incremental_leading/). 
Between these five articles, (and about a year's worth of time) the concept finally clicked in my mind.

Enter the [frameworks](http://www.alistapart.com/articles/frameworksfordesigners/).  Sometime in the last few 
years a number of CSS frameworks have emerged, including frameworks from giants like 
[Yahoo](http://developer.yahoo.com/yui/grids/), and brand-new frameworks like the 
[960 Grid System](http://960.gs/).  The most popular, as far as blogosphere-based chatter is concerned, 
is probably [Blueprint](http://code.google.com/p/blueprintcss/), which 
[recently released version 0.7](http://bjorkoy.com/past/2008/2/20/blueprint_07_has_arrived/), giving you a 
pretty good idea of how young this technology is.  So, with (at least) three frameworks out there you must be saying. 
Surely one is a suitable fit for EricDeLabar.com?"  That's exactly <del>in</del>correct, 
<ins>at least for Blueprint, but not for 960.gs</ins> and here is my reason why.

**Semantics.**  Please, put the pitchforks and torches down, I'm not saying that <del>Blueprint and</del> 960.gs 
<del>are</del> <ins>is</ins> **un**-semantic, I'm saying <del>they</del> <ins>it</ins> could be 
**more** semantic.  I'm a strong believer in separation of content from presentation, and IMHO, 
this is the reason why <acronym title="Cascading Style Sheet">CSS</acronym> 
is as amazing as it is.  If you're not 100% sold on this concept, check out [Zen Garden](http://www.csszengarden.com/) 
and order yourself a copy of [Molly Holzschlag](http://www.mezzoblue.com/">Dave Shea</a> and <a href="http://www.molly.com/)'s 
book The Zen of CSS Design.  For today's post I'm going to ignore 
YUI, mainly because it's too huge for my taste, and concentrate only on Blueprint and 960.gs.

Both Blueprint and 960.gs use <acronym title="HyperText Markup Language">HTML</acronym> class names 
to specify the width of the grid, these class names are specifically named with the number of columns the content block 
is supposed to span.  This violates the separation of content from presentation because now the HTML 
contains instructions on how to render the page.  That's it, my two-sentance, semantic-web-purist's argument against the 
current batch of CSS frameworks.  Can it be fixed?  Of course it can!  The easiest way to do this 
is probably with some sort of script-based solution that provides CSS post-processing.  Initially 
I thought of [CleverCSS](http://sandbox.pocoo.org/clevercss/), but then I realized that 
[the newest version of Blueprint already does this](http://bjorkoy.com/past/2008/2/20/blueprint_07_has_arrived/)! 
Imagine my surprise when I discovered this wonderful fact a half hour into writing my post!  Oh well, I've learned something, 
and the web is a better place, so I'm going to post this anyway, send you over to 
[the details on the Blueprint Compress ruby script on jdclayton.com](http://jdclayton.com/blueprints_compress_a_walkthrough.html), 
and formally state that I stand corrected and I will probably be using Blueprint for this site's layout.
