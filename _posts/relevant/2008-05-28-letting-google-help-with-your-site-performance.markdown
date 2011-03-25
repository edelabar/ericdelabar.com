---
layout: post
title: Letting Google Help With Your Site Performance by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>Letting Google Help With Your Site Performance</h1>
<p>Let's face it, cross-browser JavaScript and <span class="caps">AJAX</span> without a helper library or framework is pretty difficult.  However, these libraries can be pretty hefty when it comes to page download size, especially if sent uncompressed and un-optimized.  Most of the libraries have a statement in their docs that says something along the lines of "grow up and compress your JavaScript" but not all of us have sufficient access to their web host to actually be able to do that.  Enter Google.  Google's <a href="http://code.google.com/apis/ajaxlibs/"><span class="caps">AJAX</span> Libraries <span class="caps">API</span></a> serves as a <a href="http://en.wikipedia.org/wiki/Content_distribution_network">content distribution network</a> for providing pre-compressed versions of the web's favorite Web 2.0 JavaScript&nbsp;libraries:</p>
<ul>
<li><a href="http://jquery.com/">jQuery</a></li>
<li><a href="http://www.prototypejs.org/">prototype</a></li>
<li><a href="http://script.aculo.us/">script.aculo.us</a></li>
<li><a href="http://mootools.net/">MooTools</a></li>
<li><a href="http://dojotoolkit.org/">dojo</a></li>
</ul>
<p>Access to these libraries is quite simple, in fact loading prototype can be accomplished with the following four lines of&nbsp;code:</p>

{% render_gist https://gist.github.com/raw/885118/79ce770273247f525ad6f66f6b5918c40e9f1fd3/letting-google-help-with-your-site-performance.html %}

<p>Pretty simple, but let's look at some&nbsp;metrics.</p>
<table>
<thead>
<tr>
<th colspan="4">With Google</th>
<th colspan="4">Without Google</th>
</tr>
<tr>
<th colspan="2">(no cache)</th>
<th colspan="2">(local cache)</th>
<th colspan="2">(no cache)</th>
<th colspan="2">(local cache)</th>
</tr>
<tr>
<th><span class="caps">KB</span></th>
<th>Time</th>
<th><span class="caps">KB</span></th>
<th>Time</th>
<th><span class="caps">KB</span></th>
<th>Time</th>
<th><span class="caps">KB</span></th>
<th>Time</th>
</tr>
</thead>
<tbody>
<tr>
<td>66</td>
<td>982ms</td>
<td>4</td>
<td>980ms</td>
<td>252</td>
<td>2.14s</td>
<td>0</td>
<td>1.19s</td>
</tr>
</tbody>
</table>
<p>As you can see, the Google version is significantly faster and smaller on the initial load, subsequent loads a little less obvious, but still slightly faster.  However, this test was not all that scientific, since I really only have the ability to do this with Firefox and Firebug, I only did it once, and my network speed can vary significantly from request to request.  Despite all of that, testing this across a few other browser/<span class="caps">OS</span> combinations does reveal a pattern where the Google <span class="caps">AJAX</span> Library <span class="caps">API</span> pages do feel faster, even if only by a fraction of a second.  I've provided my test pages, <a href="http://www.ericdelabar.com/examples/letting-google-help-with-your-site-performance/google.html" rel="nofollow">with Google</a> and <a href="http://www.ericdelabar.com/examples/letting-google-help-with-your-site-performance/no-google.html" rel="nofollow">without-Google</a>, for you to perform your own tests, and I'd love to hear what other people think and see their&nbsp;results.</p>
<p>The verdict, I like it, but I have a few caveats.  First, as pointed out to me by <a href="http://inscrutabledesign.com/" title="Chris" rel="met friend co-worker">the Unscrutable Designer</a>, you're relying on a third party site to host your scripts, in this case it means you need to trust Google to <a href="http://en.wikipedia.org/wiki/Don't_be_evil">not be evil</a>.  Personally, I do, but that is a decision to be made on a case-by-case basis.  Secondly, you have to trust the reliability of your content distribution network, can you risk your JavaScript functionality if Google's server goes down?  Thanks to progressive enhancement, having no library should be basically the same as no JavaScript, so my properly implemented site should still function, so this is personally not a show-stopper for&nbsp;me.</p>
<p>Now, one last thought.  Keep in mind that this is not the <strong>most</strong> optimal solution since it still makes a request for each library you load and the libraries themselves are not optimized, but it does bring along with it an interesting benefit.  The more sites that use this service the higher the chance of getting a local cache hit on one of these files, which of course means one less&nbsp;download.</p>