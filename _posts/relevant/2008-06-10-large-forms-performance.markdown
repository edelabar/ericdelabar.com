---
layout: post
title: "Found Code: Optimizing Large Form Performance in JavaScript by Eric DeLabar"
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Found Code: Optimizing Large Form Performance in JavaScript

As I've covered before, [ill-used JavaScript can lead to some serious performance problems](/2008/04/javascript-getelementbyid-performance.html), 
most of which are caused by simply not thinking about what the code is really doing.  Recently I came across a 
site that provided digital photo printing,  This site had a nice interface that allowed my to upload close to 
three hundred photos.  On the resulting page, each photo was displayed with all of the available sizes as input 
boxes, which [looked something like this](/examples/large-forms-performance/unoptimized.php?qty=300" rel="nofollow). 
I liked the interface, but came across a very serious problem.  The event handlers that updated the totals box 
ran on the keyup event and recalculated the total of the entire form!  This worked fine with ten or twenty photos, 
but the 300 that I provided brought my browser to a screeching halt.

I've taken the liberty of creating a very simplistic mock-up of the form and a simplified version of the JavaScript, 
[which is available in my examples section](/examples/large-forms-performance/unoptimized.php?qty=300). 
The demo uses [Firebug](http://www.getfirebug.com/) and 
[Firebug Lite](http://www.getfirebug.com/lite.html) for logging just like I did in my 
[dollar function article](/2008/04/javascript-getelementbyid-performance.html), and the 
[benchmark class](/examples/lib/benchmark.js) from that article as well.  The site's JavaScript was a bit more 
complex and actually did an AJAX lookup of the price on each keyup, but I'm more concerned with 
the JavaScript performance here, so I simplified the code to something like this:

{% render_gist https://gist.github.com/raw/885507/6f39a9d930a2d079adb8d452b5142bb9f0e1b709/large-forms-performance.before.js %}

Basically, on window load, this code grabs every input element, sets its value to zero, and binds an event handler to it. 
The event handler runs on key up and loops through every input box in the "pictures" list, and updates the totals inputs 
at the top of the page.  As I said above, this code works fine with [20 pictures](/examples/large-forms-performance/unoptimized.php?qty=20), 
but it starts getting slow [around 300](/examples/large-forms-performance/unoptimized.php?qty=300), and becomes 
almost [unusable at 1000](/examples/large-forms-performance/unoptimized.php?qty=1000).  Care to 
[try 10,000](/examples/large-forms-performance/unoptimized.php?qty=10000)?  (Be careful, it crashes my browser!)  
To test it, simply enter values in the photo inputs and watch the totals boxes increment.

The main problem with this code comes from the  `recalculate` function.  Problem number one is my personal pet peeve, 
the dollar sign function is called at least six times!  Well, I guess six times wouldn't be terrible for the entire page, but 
it's called at least six times on every key up event!  Problem number two, the biggest problem, is the fact that this code 
re-crawls what amounts to the entire DOM every time the event fires.  Obviously the larger the DOM, the more time this is 
going to take.

So, how do we fix it?  Well, here's how I fixed it, I'll explain the details below:

{% render_gist https://gist.github.com/raw/885507/3471ebcce4389fec74ea76d76cc87262c2f4646e/large-forms-performance.after.js %}

To solve problem number one from above I created a simple object for storing references to all of the total input boxes (lines 9-14), 
now we have a simple associative array lookup whenever we need to update a total.  Problem number two is mainly solved by recording 
the original value of the input on focus (line 22, 31-35), and then comparing them on blur (line 23, 37-54).  Because we're doing 
this on blur, we can update only the necessary total input (lines 45-49) instead of recalculating the entire form.  I made one final 
tweak, mainly to make solving problem number one easier, and that is the  `recalculate` function now returns a specific 
event handler for the given input so that the event handler itself does not need to call the dollar function.

So, comparing these in my regular, not-very-scientific fashion, I came up with the following results.  I chose to measure the startup 
time, which will increase with the size of the page, as well as the event handler time.  I also measured these times across a pretty 
decent amount of pictures, and across a few browsers.

## Safari (OS X)

<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">4</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">6</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">3</a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">17</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">14</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">13</a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">33</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">24</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">26</a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">365</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">452</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">178</a></td>
</tr>
</tbody>
</table>

## Internet Explorer 7 (Windows Vista)

<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">56</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">48</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">9</a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">238</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">213</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">76</a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">457</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">424</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">235</a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">4642</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">4584</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">28110</a></td>
</tr>
</tbody>
</table>

**28 seconds!? Why!?**

## Firefox 2 (Windows Vista)

<table>
<thead>
<tr>
<th></th>
<th colspan="2">Optimized Time</th>
<th colspan="2">Unoptimized Time</th>
</tr>
<tr>
<th>Pictures</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
<th>Load (<abbr title="milliseconds">ms</abbr>)</th>
<th>Handler (<abbr title="milliseconds">ms</abbr>)</th>
</tr>
</thead>
<tbody>
<tr>
<td>10</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">12</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=10">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">8</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=10">7</a></td>
</tr>
<tr>
<td>50</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">45</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=50">0</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">31</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=50">30</a></td>
</tr>
<tr>
<td>100</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">87</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=100">1</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">60</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=100">59</a></td>
</tr>
<tr>
<td>1000</td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">985</a></td>
<td><a href="/examples/large-forms-performance/optimized.php?qty=1000">3</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">584</a></td>
<td><a href="/examples/large-forms-performance/unoptimized.php?qty=1000">581</a></td>
</tr>
</tbody>
</table>

The results pretty obviously speak for themselves, but there is one caveat, be sure to notice the initial load time. 
Since the event handlers still need to be assigned to each input on the page the more inputs there are the longer the page 
load takes, and the load time is even slightly slower on the optimized page.  Be sure to consider this time, possibly by 
capping the number of inputs displayed, since the code itself is very processor intensive and appears to actually hang the 
entire computer while processing.  Obviously, these fixes become more important as the number of inputs grows, but any speed 
increase when the user is directly interacting with the page is a good one!
