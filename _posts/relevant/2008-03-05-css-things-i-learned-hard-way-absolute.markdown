---
layout: post
title: CSS Things I Learned The Hard Way &ndash; Absolute Positioning by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# CSS Things I Learned The Hard Way &ndash; Absolute Positioning

While there's no substitute for learning something by first making all of the mistakes, 
it doesn't hurt to learn from somebody else's. In today's issue, we're going to talk 
about absolute positioning.

> **absolute**  
> The element's box is laid out in relation to its containing block, and is entirely 
> removed from the normal flow of the document. The containing block of the absolutely 
> positioned element is the nearest ancestor element with a `position` other 
> than `static`. If no such ancestor exists, then the containing block is the 
> root element of the document.
> -*[Eric A. Meyer](http://meyerweb.com/ "Eric A. Meyer, CSS Guru").  Cascading Style Sheets 2.0 Programmer's Reference.  California: Osborne/McGraw-Hill, 2001.*

In truth, the solution was in front of my face the entire time, I just never understood 
it! (Or possibly I just skimmed the paragraph and only read the first sentence, but 
that's a different issue altogether!) The problem I was seeing was that my absolutely 
positioned (`position: absolute; top: 0; left: 0;`) element was appearing in 
the upper left of the viewport, not the upper left of its containing element.

The simple solution was just to set the `position` property of my containing 
element to `relative`. 
This is a valid solution because a `relative`ly 
positioned element behaves exactly like a `static`ally positioned element, except 
that the position properties (`top`, `right`, `bottom`, and `left`) are used to offset 
the element by the specified amount. So, as long as the position properties are left 
with their default values, to make a container element, all you need is `position: relative`.
