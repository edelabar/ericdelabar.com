---
layout: post
title: "Found Code: Optimizing Large Form Performance in JavaScript by Eric DeLabar"
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>Found Code: Optimizing Large Form Performance in JavaScript</h1>
<p>As I've covered before, <a href="/2008/04/javascript-getelementbyid-performance.html">ill-used JavaScript can lead to some serious performance problems</a>, most of which are caused by simply not thinking about what the code is really doing.  Recently I came across a site that provided digital photo printing,  This site had a nice interface that allowed my to upload close to three hundred photos.  On the resulting page, each photo was displayed with all of the available sizes as input boxes, which <a href="/examples/large-forms-performance/unoptimized.php?qty=300" rel="nofollow">looked something like this</a>.  I liked the interface, but came across a very serious problem.  The event handlers that updated the totals box ran on the keyup event and recalculated the total of the entire form!  This worked fine with ten or twenty photos, but the 300 that I provided brought my browser to a screeching&nbsp;halt.</p>
<p>I've taken the liberty of creating a very simplistic mock-up of the form and a simplified version of the JavaScript, <a href="/examples/large-forms-performance/unoptimized.php?qty=300">which is available in my examples section</a>.  The demo uses <a href="http://www.getfirebug.com/">Firebug</a> and <a href="http://www.getfirebug.com/lite.html">Firebug Lite</a> for logging just like I did in my <a href="/2008/04/javascript-getelementbyid-performance.html">dollar function article</a>, and the <a href="/examples/lib/benchmark.js">benchmark class</a> from that article as well.  The site's JavaScript was a bit more complex and actually did an <span class="caps">AJAX</span> lookup of the price on each keyup, but I'm more concerned with the JavaScript performance here, so I simplified the code to something like&nbsp;this:</p>

{% render_gist https://gist.github.com/raw/885507/6f39a9d930a2d079adb8d452b5142bb9f0e1b709/large-forms-performance.before.js %}

<p>Basically, on window load, this code grabs every input element, sets its value to zero, and binds an event handler to it.  The event handler runs on key up and loops through every input box in the "pictures" list, and updates the totals inputs at the top of the page.  As I said above, this code works fine with <a href="/examples/large-forms-performance/unoptimized.php?qty=20">20 pictures</a>, but it starts getting slow <a href="/examples/large-forms-performance/unoptimized.php?qty=300">around 300</a>, and becomes almost <a href="/examples/large-forms-performance/unoptimized.php?qty=1000">unusable at 1000</a>.  Care to <a href="/examples/large-forms-performance/unoptimized.php?qty=10000">try 10,000</a>?  (Be careful, it crashes my browser!)  To test it, simply enter values in the photo inputs and watch the totals boxes&nbsp;increment.</p>
<p>The main problem with this code comes from the <code>recalculate</code> function.  Problem number one is my personal pet peeve, the dollar sign function is called at least six times!  Well, I guess six times wouldn't be terrible for the entire page, but it's called at least six times on every key up event!  Problem number two, the biggest problem, is the fact that this code re-crawls what amounts to the entire DOM every time the event fires.  Obviously the larger the DOM, the more time this is going to&nbsp;take.</p>
<p>So, how do we fix it?  Well, here's how I fixed it, I'll explain the details&nbsp;below:</p>

{% render_gist https://gist.github.com/raw/885507/3471ebcce4389fec74ea76d76cc87262c2f4646e/large-forms-performance.after.js %}

<p>To solve problem number one from above I created a simple object for storing references to all of the total input boxes (lines 9-14), now we have a simple associative array lookup whenever we need to update a total.  Problem number two is mainly solved by recording the original value of the input on focus (line 22, 31-35), and then comparing them on blur (line 23, 37-54).  Because we're doing this on blur, we can update only the necessary total input (lines 45-49) instead of recalculating the entire form.  I made one final tweak, mainly to make solving problem number one easier, and that is the <code>recalculate</code> function now returns a specific event handler for the given input so that the event handler itself does not need to call the dollar&nbsp;function.</p>
<p>So, comparing these in my regular, not-very-scientific fashion, I came up with the following results.  I chose to measure the startup time, which will increase with the size of the page, as well as the event handler time.  I also measured these times across a pretty decent amount of pictures, and across a few&nbsp;browsers.</p>
<h4>Safari (<span class="caps">OS</span>&nbsp;X)</h4>
<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load</th>
<th>Handler</th>
<th>Load</th>
<th>Handler</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">4 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">6 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">3 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">17 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">14 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">13 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">33 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">24 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">26 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">365 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">452 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">178 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
</tbody>
</table>
<h4>Internet Explorer 7 (Windows&nbsp;Vista)</h4>
<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load</th>
<th>Handler</th>
<th>Load</th>
<th>Handler</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">56 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">48 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">9 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">238 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">213 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">76 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">457 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">424 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">235 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">4642 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">4584 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">28110 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
</tbody>
</table>
<p><strong>28 seconds!?&nbsp;Why!?</strong></p>
<h4>Firefox 2 (Windows&nbsp;Vista)</h4>
<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load</th>
<th>Handler</th>
<th>Load</th>
<th>Handler</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">12 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">8 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">7 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">45 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">31 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">30 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">87 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">1 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">60 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">59 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">985 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">3 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">584 <abbr title="milliseconds">ms</abbr></a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">581 <abbr title="milliseconds">ms</abbr></a></td>
</tr>
</tbody>
</table>
<p>The results pretty obviously speak for themselves, but there is one caveat, be sure to notice the initial load time.  Since the event handlers still need to be assigned to each input on the page the more inputs there are the longer the page load takes, and the load time is even slightly slower on the optimized page.  Be sure to consider this time, possibly by capping the number of inputs displayed, since the code itself is very processor intensive and appears to actually hang the entire computer while processing.  Obviously, these fixes become more important as the number of inputs grows, but any speed increase when the user is directly interacting with the page is a good&nbsp;one!</p>