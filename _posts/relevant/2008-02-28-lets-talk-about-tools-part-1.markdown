---
layout: post
title: Let's talk about tools &ndash; Part 1 by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Let's talk about tools &ndash; Part 1

<p>After my <a href="http://blog.ericdelabar.com/2007/02/in-beginning-there-was-doctype.html" title="In the beginning there was DOCTYPE">last post</a>, we have a nice, clean starting point for our website.  Which is great, but in order to take it to the next level, we should probably get a nice development environment up and&nbsp;running.</p>

<p>First, we'll start with the client side. At my employer, we develop entirely on Windows.  In my spare time, I have a <a href="http://www.gentoo.org/">Gentoo</a> (soon to be <a href="http://www.ubuntu.com/">Ubuntu</a>) Linux box at home. Because of these factors, my tools of choice tend to be cross platform.  As far as browsers go, I develop strictly in Firefox due to its ease of debugging with tons of useful plug-ins (<a href="http://www.getfirebug.com/">Firebug</a>, <a href="http://chrispederick.com/work/webdeveloper/">Web Developer Toolbar</a>, <span class="caps">DOM</span> Inspector) and cross-platform availability.  I of course have <span class="caps">IE</span> at work; where I've switched totally to <span class="caps">IE</span> 7, and I run the <a href="http://blogs.msdn.com/ie/archive/2006/11/30/ie6-and-ie7-running-on-a-single-machine.aspx">free <span class="caps">IE</span> 6 <abbr title="Virtual Machine"><span class="caps">VM</span></abbr> provided by Microsoft</a> for testing in <span class="caps">IE</span> 6.  I also have access to a Mac running <a href="http://en.wikipedia.org/wiki/Safari_%28web_browser%29">Safari</a>, a variety of Windows Mobile smart phones, and a few versions of <a href="http://en.wikipedia.org/wiki/Opera_(web_browser)">Opera</a>, including the Wii Beta version.  Do I cover all of my bases?  Probably not, but I'm at least over 95% of the user&nbsp;base.</p>

<p>What I really want to talk about are the <a href="https://addons.mozilla.org/firefox/extensions/">Firefox plug-ins</a> I mentioned earlier; if these tools are used correctly, a properly coded site that works in Firefox works just about everywhere else as well.  To start off, make sure that when you first install Firefox, the <span class="caps">DOM</span> Inspector is installed. To do this, on the "Setup Type" screen, choose Custom, and on the "Choose Optional Components" screen, make sure the "<span class="caps">DOM</span> Inspector" check box is&nbsp;checked:</p>

<p><img src="images/custom.gif" alt="custom.gif" border="0" width="502" height="386" id="img_custom" class="clear"></p>

<p><label for="img_custom" style="display: block; text-align: center">Choose Optional Components...</label></p>

<p><img src="images/dom-inspector.gif" alt="dom_inspector.gif" border="0" width="503" height="386" id="img_inspector" class="clear"></p>

<p><label for="img_inspector" style="display: block; text-align: center">Install <span class="caps">DOM</span> Inspector...</label></p>

<p>Ok, now we're ready for plugins!  My current must haves are as&nbsp;follows:</p>

* <a href="https://addons.mozilla.org/firefox/60/">Web Developer Toolbar</a> &ndash; Tons of useful little tools that no web developer should be without.  Just install it and play with it.  Trust&nbsp;me.</li>
* <a href="https://addons.mozilla.org/firefox/1843/">Firebug</a> &ndash; Amazing debugging and profiling tools, plus the Inspect button which lets you see which <span class="caps">CSS</span> rules apply to any element in your doc, and a fancy colored overlay showing element, margin and&nbsp;padding.</li>
* <a href="https://addons.mozilla.org/firefox/539/">MeasureIt</a> &ndash; Great tool for pixel-perfect&nbsp;measuring!</li>
* <a href="https://addons.mozilla.org/firefox/271/">ColorZilla</a> &ndash; Quickly grab colors without viewing page&nbsp;source.</li>
* <a href="https://addons.mozilla.org/firefox/249/"><span class="caps">HTML</span> Validator</a> &ndash; <span class="caps">W3C</span> Validation on the fly, and in your view-source&nbsp;window.</li>
* <a href="https://addons.mozilla.org/firefox/655/">View Source Chart</a> &ndash; Great for dealing with tag-soup or server generated code that's not nicely tabbed or&nbsp;spaced.</li>
* <a href="https://addons.mozilla.org/firefox/4106/">Operator</a> &ndash; A must have for developing with (and using)&nbsp;<a href="http://microformats.org/">Microformats</a>.</li>
* <a href="http://blog.codeeg.com/tails-firefox-extension-03/">Tails</a> &ndash; Another must have for developing with (and using)&nbsp;<a href="http://microformats.org/">Microformats</a>.</li>

<p>If you're still stuck in <span class="caps">IE</span> land, there's still hope, Microsoft has released a half-decent copycat Web Developer Toolbar, and there's hope for their <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=2f465be0-94fd-4569-b3c4-dffdf19ccd99&amp;DisplayLang=en">(Java)Script debugger</a>.  If you have a Genuine Advantage copy of Windows it won't hurt to try them&nbsp;out.</p>

<p>That's it!  Get those installed, play with them, and tune in next time for <a href="http://blog.ericdelabar.com/2007/03/lets-talk-about-tools-part-2.html" title="Let's talk about tools &ndash; Part 2">part 2</a>, where we setup <a href="http://www.eclipse.org/">Eclipse</a> and <a href="http://httpd.apache.org/">Apache</a> as a test web server on&nbsp;Windows.</p>