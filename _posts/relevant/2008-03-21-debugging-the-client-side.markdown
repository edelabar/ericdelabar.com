---
layout: post
title: Debugging the Client Side
metadesc: 
class: post
changefreq: never
priority: 0.9
categories: [relevant, css, standards, tools, web 2.0]
---
By my definition of [Web 2.0](/2008/02/web-20-religion-politics), one of the key requirements for any 
application is cross-browser compatibility.  As a company, my employer defines this as IE 
6+, Firefox 2+, and Safari 3 beta; all tested on Windows.  It's not ideal, but it covers a huge chunk of the market. 
This stack is pretty easy to test, but occasionally one of the browsers will throw a curve-ball and that's where a 
typical the members of my team, or J2EE developers in general, get lost.

When somebody comes across some weird client-side error and they come looking for my help, I start with three questions:

1. Does it [validate](http://validator.w3.org/)? (Is it a strict doctype?)
2. Is it in [quirks mode](http://www.quirksmode.org/css/quirksmode.html)?
3. Did you separate content from presentation from behavior?

I think one and two are pretty obvious, if you're not following the standards the browser can (and will) do what 
it wants with your page.  Follow the rules and your playing field becomes a lot more level.  Number three is a 
design choice that I prefer for keeping things clean; if your layers are separated, you *know* what behavior 
is coming from where.  What does this mean?  It means style is *always* stored in an external StyleSheet, 
JavaScript is *always* stored in an external JS file, and your 
HTML markup has no inline event handlers, script blocks, or style attributes.  Not only 
does this make things easier to find and debug it also encourages progressive enhancement and accessible design.

Now that you've made sure those three cases are taken care of, do you still have the problem?  I'd say 50% of the 
time the problem is solved, for the rest, here's what I do.  (First things first, 
[make sure your toolbox is in order](/2007/02/lets-talk-about-tools-part-1.html).)

For debugging <acronym title="Cascading Style Sheet">CSS</acronym>, use 
[Firebug's](http://www.getfirebug.com/) Inspect tool to make sure the correct 
<acronym title="Cascading Style Sheet">CSS</acronym> rules are applying 
to your element, this will show you which rules are applying and more importantly, which one 
is winning in the case of a conflict.  If the problem is not showing up in 
[Firefox](http://www.mozilla.com/en-US/firefox/), I'm guessing it also works in Safari, 
so it has be an IE issue.  Check your `float`s, check your 
`width`s, and make sure you're not relying on anything IE doesn't support, like 
`min-height` or `max-height`.  If you're still not sure what's going on, checkout the Microsoft Developer Toolbar. 
To get it, go to Microsoft.com and search for "Developer Toolbar," I'd post a link, but every time I try 
bookmarking the page it moves, so it's probably just easier to search for it.  The Developer Toolbar works 
similarly to [Firebug](http://www.getfirebug.com/), but is definitely lacking.  If your problem 
is in Safari, get a copy of the [Webkit](http://webkit.org/) Nightly and enable the 
[Web Inspector](http://trac.webkit.org/projects/webkit/wiki/Web%20Inspector).  It's definitely 
better than the IE Developer Toolbar, but still not [Firebug](http://www.getfirebug.com/).  
In a pinch, try out the [WestCiv](http://www.westciv.com/) 
[XRAY](http://www.westciv.com/xray/index.html) and 
[MRI](http://www.westciv.com/mri/index.html) bookmarklets which are easy 
enough to install and uninstall on a workstation that is not your own.

If you're debugging JavaScript, the [Firebug](http://www.getfirebug.com) console is definitely the 
way to go for tracing, and you can even make it work on other browsers with their handy 
[JavaScript-based utility](http://www.getfirebug.com/lite.html" title="Firebug Lite).  For 
IE specific errors you can try your luck with the Microsoft Script Debugger (again, 
search for it), but I find it to be a little bloated.  At the time of this writing Webkit offers its own 
debugger in the form of [Drosera](http://trac.webkit.org/projects/webkit/wiki/Drosera), but it's 
Mac-only, so unless you've got one you're out of luck there.  Finally, you can try out 
[Aptana Studio](http://aptana.com/studio/) which offers JavaScript debugging in Firefox (also in 
IE if you're willing to pay for it), but I haven't had a chance to really give it 
a test drive and at initial glance it seems a little clunky when working with J2EE.

There's a ton of tools out there for debugging client-side problems, and with a little practice you'll be 
debugging like a pro in no time at all.  But please, remember one thing, the best offense is a good defense, 
separate your layers, avoid CSS hacks, and do things the right way the first time.
