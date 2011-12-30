---
layout: post
title: "Hammering Screws: Programmers and Tool Blindness by Eric DeLabar"
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Hammering Screws: Programmers and Tool Blindness

[<img src="/img/content/screws.jpg" alt="screws.jpg" border="0" width="200" height="150" style="margin-top: 0;">](http://www.flickr.com/photos/didmyself/2368738599/)
[In my last post](/2008/06/coding-your-fingers-off.html) I told a half-truth by ending with 
<q>If you need me I'll be uninstalling Eclipse.</q>  Honestly, I only removed it from my laptop because 
I rarely do any real Java development directly on my laptop, and should I need a quick code editor I have 
[TextMate](http://macromates.com/) which handles most of my coding needs pretty simply. 
However, the commotion that the statement caused is what I'm going to address in this post. 

> If all you have is a hammer, everything looks like a nail.  
> --*[Bernard Baruch](http://en.wikipedia.org/wiki/Bernard_Baruch)*

To continue with my tools theme I'm going to address what I'll call "tool-blindness," the mentality that 
the tools you have and know how to use are perfect for every situation.  In other words, if the tools you 
have require you to hammer screws then by-god you're going to hammer screws.

Recently there has been a grass-roots, developer movement at my employer to switch from 
[Ant](http://ant.apache.org/) to 
[Maven](http://maven.apache.org/).  I love Maven, 
it's leaps and bounds better than the *way we were using* Ant.  (Notice I didn't say Ant in general, 
I'm only planning on starting one holy-war with this post!)  My last four projects have used Maven, and it 
makes the build and deploy process significantly easier, especially when it comes to dependancy management. 
However, [everyone's favorite Java IDE](http://www.eclipse.org/) does 
not play well with Maven because Maven's standard directory layout is significantly different from Eclipse's 
convention.  People have attempted to alleviate this problem by using the [M2 plug-in](http://m2eclipse.codehaus.org/) 
and [following the instructions here](http://www.devx.com/Java/Article/36785), but the result 
still feels like you're forcing Eclipse to do something it doesn't want to.  Add that to the fact that 
the version of Eclipse we're using crashes at least once a day, and you should be able to see why I'm 
looking for alternatives.

In short, our metaphorical hardware (the build process) has changed from nails to screws and our hammer 
(Eclipse) is no longer the best tool for the job.  However, we're still using the hammer because it's what 
everyone knows how to use and only a few of us are not tool-blind enough to look for something else.  It 
also doesn't help that the alternatives that play nicely with Maven, namely [IntelliJ IDEA](http://www.jetbrains.com/idea/) 
and Textmate-and-a-shell are not "[free as in beer](http://c2.com/cgi/wiki?FreeAsInBeer)."

As I mentioned in the comments of my [last post](/2008/06/coding-your-fingers-off.html), Eclipse 
has been feeling a little more like [this tool](http://forums.mtbr.com/showthread.php?t=338564) 
than [this one](http://www.wengerna.com/browse/product.jsp?prod_id=20&amp;cat_id=1&amp;cat_name=Knives&amp;sub_cat_id=18). 
So maybe it's time to ask which tool you really want on your tool belt.

In an interesting turn of events, Alex Vazquez over at [Wufoo](http://wufoo.com/)/[Particletree](http://particletree.com/) is going through the same process with a different perspective. 
Alex is moving, based in part by recommendation and in part by language choice, from Java on Eclipse to PHP 
on Textmate, and he seems to be liking it so far.  Alex does, however, sum up Eclipse rather nicely, and 
coincidentally within my theme:

> The right development environment can save a programmer countless hours and is like a hammer 
> in the carpenter's tool belt. Since my background was in Java, my preference was for large sledge hammers 
> and my development environment of choice was the de facto Java IDE Eclipse. It 
> has a number of amazing features like autocomplete, refactoring and hundreds of plugins for every task 
> imaginable. It's no secret Java requires mountains of code, but Eclipse was made to move mountains.  
> --*[Alex Vazquez](http://particletree.com/features/eclipse-to-textmate-an-ideological-change/)*

I think Alex really nails (pardon the pun) the fact that if you're going to be doing Java *Enterprise* 
development you **need** an IDE that can handle it.  You need something 
that generates the code and provides the re-factoring tools and autocompletion to make it possible to 
<q>move mountains.</q>  However I'd like to pose a question to all Java developers who use Eclipse; how much of 
Eclipse do you **really** use?  Besides re-factoring, code completion/generation, and cvs/svn/scm 
integration, is there anything else you couldn't live without?  Anything else that Textmate doesn't do? 
(Besides run on Windows, we'll save that tool for a different day.)  Look at all of the stuff Eclipse does that 
you don't use, is the added bulk really worth it?  How much memory is your Eclipse process using right now? 
(Mine's got ~254MB, 5x more than the next largest memory footprint, and my Eclipse 
process is basically idle.)  Just my two cents, please form your own opinions, after all 
[I'm just a kid who couldn't possibly have any experience](/2008/06/coding-your-fingers-off.html#comment-1280).
