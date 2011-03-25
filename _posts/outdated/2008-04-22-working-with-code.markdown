---
layout: post
title: Working With Code by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
<h1>Working With Code</h1>
<p>Now that I have some content, and a nice habit of writing every day, I've started concentrating a little more on how this blog looks, especially since the <a href="http://www.may1reboot.com/2008/">May 1st reboot</a> is only 8 days&nbsp;away!</p>
<p>To start, since this is a blog mainly about writing some form of code or another I needed a good way to do some syntax highlighting.  My requirements were pretty simple, it should require very little manual intervention beyond the <code>&lt;code&gt;&lt;pre&gt;&lt;/pre&gt;&lt;/code&gt;</code> tags, it should support HTML, CSS, JavaScript, Java, and possibly Ruby and PHP, and line numbers would be nice.  I found all of this in the wonderful <a href="http://wordpress.org/extend/plugins/wp-syntax/">wp-syntax plug-in</a> by <a href="http://ryan.mcgeary.org/">Ryan McGeary</a> based on the <a href="http://qbnz.com/highlighter/">GeSHi Generic Syntax&nbsp;Highlighter</a>.</p>
<p>Setting it up was a breeze, as usual for WordPress plug-ins, upload, unzip, and it works.  Creating the markup was also pretty simple, since all of my code blocks were already wrapped in <code>&lt;code&gt;&lt;pre&gt;&lt;/pre&gt;&lt;/code&gt;</code> it was just a matter of adding the appropriate <code>lang</code> attribute to the <code>pre</code> element.  I did however, run into one minor problem, I had all of my HTML code escaped to to use <code>&amp;lt;</code> and <code>&amp;gt;</code> instead of <code>&lt;</code> and <code>&gt;</code>, but one quick search and replace in <a href="http://www.red-sweater.com/marsedit/">MarsEdit</a> for each post, and that was solved as&nbsp;well.</p>