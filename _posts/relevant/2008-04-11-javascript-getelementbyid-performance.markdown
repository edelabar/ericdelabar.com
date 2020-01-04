---
layout: post
title: "Found Code: JavaScript getElementById, Performance, and the $ Function"
metadesc: 
class: post
changefreq: never
priority: 0.9
categories: [relevant, found code, javascript, performance, web 2.0]
---
From what I've seen, most of the popular JavaScript frameworks out there provide some form of the `$` 
method.  This method is usually a cross-browser translation of `document.getElementById` with a few 
extras.  What this means is instead of always having to type `document.getElementById("myId")` you 
can now type `$("myId")`.  All-in-all it's a very nice shortcut and will probably cut quite a bit of 
typing out of your JavaScript projects.  My problem is with the number of times I've come across inefficient uses 
of this helper function because it's easier to type.  This usually manifests itself as something along these lines 
(this example written using prototype.js):

{% render_gist https://gist.github.com/raw/885478/e194f6691319f7dba80b4ea2b021f5164c131a09/javascript-getelementbyid-performance.before.js %}

This code looks pretty concise, if you know what the `$` function does it's also pretty simple, but take 
a second to think about performance.  In this code it's possible that you're calling `document.getElementById` 
**five times**!  Ignoring whatever else the `$` function does, the 
`document.getElementById` function *could* traverse the entire <acronym title="Document Object Model">DOM</acronym> 
on each call.  (I'm not saying it does, but you really don't know what the browser is doing under the covers and since 
you're designing for all JavaScript enabled browsers, it's better safe than sorry!)  If you actually had to type out the 
`document.getElementById` you would probably consider something like this:

{% render_gist https://gist.github.com/raw/885478/94bc767c5860abb93bc7acfdd0be88ab13f2dd11/javascript-getelementbyid-performance.after.js %}

With this code, you're only calling `document.getElementById` once, and therefore only traversing the 
<acronym title="Document Object Model">DOM</acronym> once.  Makes a little more sense right?  
Let's look at some metrics.

For this experiment, let's make the assumption that the larger your document is the longer it will take to perform a 
<acronym title="Document Object Model">DOM</acronym> traversal, so in order to see some results 
we'll need a decent sized document.  For that we'll go to wikipedia and grab something off the front page, in this case 
it'll be [Harry Potter](http://en.wikipedia.org/wiki/Harry_Potter).  To get my test document I viewed the source, 
grabbed the main body content, and pasted it into a new HTML document.  I also removed all of the 
images since I didn't want broken images or to be hitting wikipedia's servers for my experiment.  I wrote a quick JavaScript 
class that will do my benchmarking, and a quick test case that calls my two methods above as well as two other methods and 
single calls to both the `$` function and the `document.getElementById` function.  To perform the 
benchmark, I run each method 1000 times.  I initially tried smaller numbers but there was not enough visual difference to 
prove my theory since JavaScript is only accurate to the millisecond.  You can find 
[the test code here](http://www.ericdelabar.com/examples/javascript-getelementbyid-performance/test.js), the 
[benchmark class here](http://www.ericdelabar.com/examples/lib/benchmark.js), and you can 
[run the test here](http://www.ericdelabar.com/examples/javascript-getelementbyid-performance/wiki.html). 
I'm using [Firebug Lite](http://www.getfirebug.com/lite.html) for the console logging, but if you have 
[Firebug](http://www.getfirebug.com/) installed it will use the Firebug console.  As I said before I just wrote the 
benchmarking class, but look for a future post and improved version now that the seed has been planted.

I have successfully run the test on Safari 3.1 on OSX 10.5, Firefox 2.0.0.13 and 
IE</span> 7.0.6000.16643 on Windows Vista Business 64-bit, and <span class="caps">IE 6.0.2900... 
and Safari 3.0.4 on Windows XP Pro.  My results were as follows:

<table>
<thead>
<tr>
<th></th>
<th style="text-align: right;">getElementById</th>
<th style="text-align: right;">$ function</th>
<th style="text-align: right;">Un-optimized $ function</th>
<th style="text-align: right;">Optimized $ function</th>
<th style="text-align: right;">Un-optimized getElementById</th>
<th style="text-align: right;">Optimized getElementById</th>
</tr>
</thead>
<tbody>
<tr>
<th>Safari Mac</th>
<td style="text-align: right;">1 ms</td>
<td style="text-align: right;">4 ms</td>
<td style="text-align: right;">67 ms</td>
<td style="text-align: right;">37 ms</td>
<td style="text-align: right;">42 ms</td>
<td style="text-align: right;">33 ms</td>
</tr>
<tr>
<th>Firefox</th>
<td style="text-align: right;">7 ms</td>
<td style="text-align: right;">9 ms</td>
<td style="text-align: right;">177 ms</td>
<td style="text-align: right;">121 ms</td>
<td style="text-align: right;">154 ms</td>
<td style="text-align: right;">118 ms</td>
</tr>
<tr>
<th>IE 7</th>
<td style="text-align: right;">273 ms</td>
<td style="text-align: right;">291 ms</td>
<td style="text-align: right;">1829 ms</td>
<td style="text-align: right;">364 ms</td>
<td style="text-align: right;">1688 ms</td>
<td style="text-align: right;">337 ms</td>
</tr>
<tr>
<th>IE 6</th>
<td style="text-align: right;">312 ms</td>
<td style="text-align: right;">297 ms</td>
<td style="text-align: right;">1960 ms</td>
<td style="text-align: right;">484 ms</td>
<td style="text-align: right;">1735 ms</td>
<td style="text-align: right;">375 ms</td>
</tr>
<tr>
<th>Safari Windows</th>
<td style="text-align: right;">0 ms</td>
<td style="text-align: right;">0 ms</td>
<td style="text-align: right;">94 ms</td>
<td style="text-align: right;">47 ms</td>
<td style="text-align: right;">47 ms</td>
<td style="text-align: right;">46 ms</td>
</tr>
</tbody>
</table>

Across the board the optimized functions performed better, and in most cases the `$` function was 
slightly slower than the `document.getElementById` function.  The most surprising result is Safari 
on Windows because it's actually the slowest machine that these tests were run on.  The only problem that I 
can think of with this test is that it does quite a bit of looking up by id, and that's probably not an accurate 
test case, but even if you're cutting out only a few milliseconds on an event, somebody will notice the 
improvement.  I'm welcome to any suggestions or comments on my testing methodology.

