---
layout: post
title: Working With Code by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
# Working With Code

Now that I have some content, and a nice habit of writing every day, I've started concentrating a 
little more on how this blog looks, especially since the [May 1st reboot](http://www.may1reboot.com/2008/) 
is only 8 days away!

To start, since this is a blog mainly about writing some form of code or another I needed a good 
way to do some syntax highlighting.  My requirements were pretty simple, it should require very 
little manual intervention beyond the <code>&lt;code&gt;&lt;pre&gt;&lt;/pre&gt;&lt;/code&gt;</code> tags, 
it should support HTML, CSS, JavaScript, Java, and possibly Ruby and PHP, and line numbers would be nice. 
I found all of this in the wonderful [wp-syntax plug-in](http://wordpress.org/extend/plugins/wp-syntax/) 
by [Ryan McGeary](http://ryan.mcgeary.org/) based on the 
[GeSHi Generic Syntax Highlighter](http://qbnz.com/highlighter/).

Setting it up was a breeze, as usual for WordPress plug-ins, upload, unzip, and it works.  Creating 
the markup was also pretty simple, since all of my code blocks were already wrapped in 
<code>&lt;code&gt;&lt;pre&gt;&lt;/pre&gt;&lt;/code&gt;</code> it was just a matter of adding the 
appropriate `lang` attribute to the 
`pre` element.  I did however, run into 
one minor problem, I had all of my HTML code escaped to to use <code>&amp;lt;</code> and 
<code>&amp;gt;</code> instead of <code>&lt;</code> and <code>&gt;</code>, but one quick search and replace 
in [MarsEdit](http://www.red-sweater.com/marsedit/) for each post, and that was solved as well.
