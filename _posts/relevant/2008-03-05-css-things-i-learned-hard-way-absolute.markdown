---
layout: post
title: CSS Things I Learned The Hard Way &ndash; Absolute Positioning by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>CSS Things I Learned The Hard Way &ndash; Absolute Positioning</h1>
<p>While there's no substitute for learning something by first making all of the mistakes, it doesn't hurt to learn from somebody else's. In today's issue, we're going to talk about absolute&nbsp;positioning.</p>
<blockquote>
	<p><strong>absolute</strong><br>The element's box is laid out in relation to its containing block, and is entirely removed from the normal flow of the document. The containing block of the absolutely positioned element is the nearest ancestor element with a <code>position</code> other than <code>static</code>. If no such ancestor exists, then the containing block is the root element of the&nbsp;document.</p>
	<p><cite><a href="http://meyerweb.com/" title="Eric A. Meyer, CSS Guru">Eric A. Meyer</a>.  Cascading Style Sheets 2.0 Programmer's Reference.  California: Osborne/McGraw-Hill,&nbsp;2001.</cite></p>
</blockquote>
<p>In truth, the solution was in front of my face the entire time, I just never understood it! (Or possibly I just skimmed the paragraph and only read the first sentence, but that's a different issue altogether!) The problem I was seeing was that my absolutely positioned (<code>position: absolute; top: 0; left: 0;</code>) element was appearing in the upper left of the viewport, not the upper left of its containing&nbsp;element.</p>
<p>The simple solution was just to set the <code>position</code> property of my containing element to <code>relative</code>. This is a valid solution because a <code>relative</code>ly positioned element behaves exactly like a <code>static</code>ally positioned element, except that the position properties (<code>top</code>, <code>right</code>, <code>bottom</code>, and <code>left</code>) are used to offset the element by the specified amount. So, as long as the position properties are left with their default values, to make a container element, all you need is <code>position:&nbsp;relative</code>.</p>