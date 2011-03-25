---
layout: post
title: Border Weirdness in Internet Explorer by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>Border Weirdness in Internet Explorer</h1>
<p>While helping a friend rework his <a href="http://www.vintageboardgames.net/">Vintage Board Games</a> site (rework not live yet), we came across an interesting <span class="caps">IE</span> bug.  In a nutshell, in some cases, <span class="caps">IE</span> was placing a <span class="caps">CSS</span> background image relative to the outside of an element's border instead of the&nbsp;inside.</p>
<p>The <a href="/examples/weird-borders-ie7/" rel="nofollow">simplified markup of the bug and <span class="caps">CSS</span> are as&nbsp;follows:</a></p>

{% render_gist https://gist.github.com/raw/885512/e5d398d85bb563850628e57bc27e95ff144769f6/weird-borders-ie.html %}

{% render_gist https://gist.github.com/raw/885512/8143061a5459ffa6930e6c9baa939c3bc775d396/weird-borders-ie.before.css %}

<p>Basically, it's a two column layout with the columns wrapped in a <code>div</code> that has a large border.  (That <code>div</code> also has a background image set on it.  The <code>.container</code> <code>div</code> seems extraneous in this example but was a requirement for the layout.)  The desired rendering of this markup should look something like the following: (Note: the black/brown box is the background&nbsp;image.)</p>
<p><img src="images/ie-correct.gif" alt="ie_correct.gif" border="0" width="427" height="327" style="float: none;"></p>
<p>But in <span class="caps">IE</span>, we get&nbsp;this:</p>
<p><img src="images/ie-bug.gif" alt="ie_bug.gif" border="0" width="427" height="327" style="float: none;"></p>
<p>If you don't trust my images, please <a href="/examples/weird-borders-ie7/index.php" rel="nofollow">try for&nbsp;yourself</a>.</p>
<p>We quickly found two solutions to this problem, <a href="/examples/weird-borders-ie7/index.php?solution=1" rel="nofollow">the first</a> involved altering the alignment of the background image to be <code>center</code> instead of&nbsp;<code>left</code>:</p>

{% render_gist https://gist.github.com/raw/885512/71f5d64643a4e52840b31151147b5ab4ab3eea6e/weird-borders-ie.solution1.css %}

<p>This is how we actually solved the problem on the site.  <a href="/examples/weird-borders-ie7/index.php?solution=2" rel="nofollow">The second solution</a> I found while attempting to narrow down the cause of this problem.  For this solution we simply set a <code>min-height</code> on the <code>.content</code>&nbsp;<code>div</code>:</p>

{% render_gist https://gist.github.com/raw/885512/c7e24317163bf5c9a09e1f7628d512392abc0f78/weird-borders-ie.solution2.css %}

<p>I'm assuming this is some sort of <a href="http://www.satzansatz.de/cssd/onhavinglayout.html">hasLayout</a> issue and giving the <code>div</code> a <code>min-height</code> (<code>height</code> in IE6, accomplished with <a href="http://www.quirksmode.org/css/condcom.html">conditional comments</a> in <a href="/examples/weird-borders-ie7/index.php?solution=2" rel="nofollow">my example</a>) also gives it layout, but I honestly have no idea what causes this.  Anybody have any&nbsp;thoughts?</p>