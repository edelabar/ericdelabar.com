---
layout: post
title: Online Identity and the Social Graph by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>Online Identity and the Social Graph</h1>
<p>If I'm ever going to be rich and famous people will need to know who I am.  *Removes tongue from cheek.*  If anyone knows who I am it should probably be Google.  How good is a web guru if they're not number one in Google for their own name?  Seriously would you trust anything I had to say if you couldn't find me in Google?  Well, it seems I have that covered, at least for now, I'm number one, two, three and four on a search for <em>eric delabar</em>.  My problem starts with result number&nbsp;five.</p>
<p>The previous owner of the number one spot on Google is a professional soccer player and coach who shares my name.  No offense to him, but I really don't want the association.  So here's my problem, I can establish <em>me</em>, but how do I establish <em>not&nbsp;me</em>?</p>
<p>To establish me I've of course created this blog, it's hosted on ericdelabar.com how more authoritative can you be.  I've created an <a href="/identity">identity page</a> written with <a href="http://gmpg.org/xfn/"><span class="caps">XFN</span> markup</a> to establish what other sites, accounts, and profiles out there are mine, and I've created a <a href="/foaf.rdf"><span class="caps">FOAF</span> file</a> and linked to it from the <code>head</code> of this document.  If I understand the <a href="http://code.google.com/apis/socialgraph/">Google Social Graph <span class="caps">API</span></a>, this pretty much means I've established me, at least I will have as soon as my site's been crawled and&nbsp;indexed.</p>
<p>What about <em>not me</em>?  Good question; there is no <code>rel="not-me"</code> in XFN, maybe there should be, but then again is it really necessary?  It's also really not the point of XFN, maybe Google needs some extensions in order to more appropriately identify the edge types. Or maybe they just figure that if I used my identity page to point to all sites that are <em>me</em> doesn't that mean anything that isn't specified isn't me?  What about things I haven't written myself?  For instance a news article on "Eric DeLabar," can I establish that one article is about me and another article is about the soccer player?  How about blog and forum comments, it would be great to have an authenticated and decentralized means of establishing me on a site that is not my own.  It would be even better if I could then aggregate these comments into my own site to track my current conversations in the&nbsp;blogosphere.</p>
<p>I guess what this all comes down to is that I'm wondering how long until Google has the ability to generate something like the&nbsp;following:</p>
<p><img src="images/google-people-links.gif" alt="A mocked screenshot of Google site links changed to be about Eric DeLabar in a hypothetical Google Person Links." border="0" width="696" height="304"></p>
<p>Google, are you listening?  A few more <a href="http://microformats.org/">microformat</a> parsers, an opt-out (or opt-in) page, and the information you already&nbsp;have.</p>