---
layout: post
title: Border Weirdness in Internet Explorer by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Border Weirdness in Internet Explorer

While helping a friend rework his [Vintage Board Games](http://www.vintageboardgames.net/) site (rework not live yet), 
we came across an interesting IE bug.  In a nutshell, in some cases, IE was placing a CSS background image relative to the outside 
of an element's border instead of the inside.

The [simplified markup of the bug and CSS are as follows:](/examples/weird-borders-ie7/)

{% render_gist https://gist.github.com/raw/885512/e5d398d85bb563850628e57bc27e95ff144769f6/weird-borders-ie.html %}

{% render_gist https://gist.github.com/raw/885512/8143061a5459ffa6930e6c9baa939c3bc775d396/weird-borders-ie.before.css %}

Basically, it's a two column layout with the columns wrapped in a `div` that has a large border.  (That 
`div` also has a background image set on it.  The `.container` `div` seems extraneous in this example but was a 
requirement for the layout.)  The desired rendering of this markup should look something like the following: 
(Note: the black/brown box is the background image.)

<img src="/img/content/ie-correct.gif" alt="ie_correct.gif" border="0" width="427" height="327" style="float: none;">

But in IE, we get this:

<img src="/img/content/ie-bug.gif" alt="ie_bug.gif" border="0" width="427" height="327" style="float: none;">

If you don't trust my images, please [try for yourself](/examples/weird-borders-ie7/index.php).

We quickly found two solutions to this problem, [the first](/examples/weird-borders-ie7/index.php?solution=1) 
involved altering the alignment of the background image to be `center` instead of 
`left`:

{% render_gist https://gist.github.com/raw/885512/71f5d64643a4e52840b31151147b5ab4ab3eea6e/weird-borders-ie.solution1.css %}

This is how we actually solved the problem on the site. 
[The second solution](/examples/weird-borders-ie7/index.php?solution=2) I found while attempting to 
narrow down the cause of this problem.  For this solution we simply set a `min-height` on the 
`.content` `div`:

{% render_gist https://gist.github.com/raw/885512/c7e24317163bf5c9a09e1f7628d512392abc0f78/weird-borders-ie.solution2.css %}

I'm assuming this is some sort of [hasLayout](http://www.satzansatz.de/cssd/onhavinglayout.html) issue and giving 
the `div` a `min-height` (`height` in IE6, accomplished with [conditional comments](http://www.quirksmode.org/css/condcom.html) 
in [my example](/examples/weird-borders-ie7/index.php?solution=2" rel="nofollow)) also gives it layout, but I honestly 
have no idea what causes this.  Anybody have any thoughts?
