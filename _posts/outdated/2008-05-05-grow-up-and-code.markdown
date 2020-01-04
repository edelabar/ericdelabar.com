---
layout: post
title: Grow Up and Code
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
categories: [outdated, JavaOne2008, groovy, java, programming, soap box, thoughts]
---
[Groovy](http://groovy.codehaus.org/), like 
[Ruby](http://www.ruby-lang.org/en/), is one of those 
<acronym title="Don't Repeat Yourself">DRY</acronym>, elegant, and 
fun programming languages.  In fact, one of the Groovy mantras is "the things you do the most 
often, Groovy makes the easiest."  That's a pretty powerful statement, but with all things 
powerful, with great power comes great responsibility.

Groovy does some things that are inconsistent, for instance, consider running the following 
block of Groovy code:

{% render_gist https://gist.github.com/raw/885082/b7466d74acb857c101f3f0924181afdc292252ec/grow-up-and-code.groovy %}

Line 2 returns the class name of the list variable, in this case `java.util.ArrayList`; 
line 5 throws an error.  This inconsistency is because Groovy allows the fields of a map to be 
accessed like a property, which means `map.class` is equivalent to 
`map["class"]` 
which refers to a key `class` in our map which does not exist.  Because Groovy is 
interpreted and not compiled there's no compiler to catch this error and it is possible that 
without an adequate amount of testing or review a piece of code like this could make it out as a bug. 
This point was brought up as a problem with Groovy to [Jeff Brown](http://javajeff.blogspot.com/), 
the instructor of the "[Rapid Web Development with Groovy &amp; Grails](http://java.sun.com/javaone/sf/javauniversity.jsp#M5)" 
Java University session at [JavaOne](http://java.sun.com/javaone/sf/index.jsp). 
Jeff agreed that it was an issue, but basically just ignored it and moved on.  I argue that it's 
not a problem with the language it's a problem with the developer.

Groovy's documentation contains a [list of things you can do with Groovy but probably shouldn't](http://groovy.codehaus.org/Things+you+can+do+but+better+leave+undone), 
on said list, this problem is identified as number one.  Groovy provides the ability to write unit 
tests, which if done correctly should catch this bug.  But more importantly, a programmer should 
know the language he's programming with, or his code should be reviewed by somebody who does. 
If your methodology allows for a bug like this to be released into the wild, you have bigger problems.

Groovy is a programming language for people who know how to program.  People who realize the simplistic 
beauty of the syntax and the elegance it provides for solving problems in a <acronym title="Don't Repeat Yourself">DRY</acronym> manner. 
Groovy is not for beginners, beginners need time to learn how to code before they should be allowed to 
take shortcuts.  More importantly, beginners rely too heavily on tools, tools that more often than not 
act more as a crutch than an asset, and tools that cannot catch problems like the one above.

My solution?  Grow up and code.  When you've written enough code to realize that the best <acronym title="Integrated Development Environment">IDE</acronym> 
is [Vim](http://www.vim.org/), 
[Emacs](http://www.gnu.org/software/emacs/), or 
[TextMate](http://macromates.com/), and a terminal, you're ready for Groovy and Grails. 
When the necessity of unit testing finally clicks in your head, you're ready for Groovy and Grails. 
When you finally understand that code *is* poetry, you're ready for Groovy and Grails.  Until 
that point, keep writing code or find a new career.  I can only hope that maybe one day you'll understand, 
but if you never do, keep your opinions in your own space and don't pollute our elegance with your 
misunderstanding.  Just because you can't write beautiful code doesn't mean the rest of the world can't.
