---
layout: post
title: In the beginning there was DOCTYPE by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>In the beginning there was DOCTYPE</h1>
<p>Alright, in the beginning there wasn't <a href="http://en.wikipedia.org/wiki/Document_Type_Declaration"><span class="caps">DOCTYPE</span></a>, it didn't come along until about the time <abbr title="eXtensible HyperText Markup Language"><span class="caps">XHTML</span></abbr> was released; however, if you want to do the Web 2.0 thing right, it helps to start on a solid&nbsp;base.</p>
<p>My goal here is to get a brand-new <abbr title="HyperText Markup Language"><span class="caps">HTML</span></abbr> document up and running as a good base for designing a Web 2.0 application. Today, we'll look at the parts of a document that the typical user doesn't actually see, but play a huge role in how a user finds your site and how it's actually rendered on their&nbsp;screen.</p>
<p>First things first; make your <span class="caps">DOCTYPE</span> the first line of the file.  That's right, line number one, no <abbr title="eXtensible Markup Language"><span class="caps">XML</span></abbr> definition, no spaces, no server-side code, the first line of the file.  This ensures that you don't end up in <a href="http://en.wikipedia.org/wiki/Quirks_mode" title="For more information about quirks mode, check out Wikipedia">quirks mode</a> accidentally.  Now, as far as <span class="caps">DOCTYPE</span>'s go, I really only see two options, <a href="http://www.w3.org/TR/html4/cover.html#minitoc" title="The Official W3C HTML 4.01 Specification...learn it, live it, love it...just kidding, it these things read like some other language, but it's useful to know they're there."><span class="caps">HTML</span> 4.01 Strict</a> and <a href="http://www.w3.org/TR/xhtml1/cover.html#minitoc" title="The Official W3C XHTML 1.0 Specification...learn it, live it, love it...just kidding, it these things read like some other language, but it's useful to know they're there."><span class="caps">XHTML</span> 1.0 Strict</a>.  There are theoretically valid arguments for not using <abbr title="eXtensible HyperText Markup Language"><span class="caps">XHTML</span></abbr>, most of which have to do with the simple fact that most web servers don't serve it as <abbr title="eXtensible Markup Language"><span class="caps">XML</span></abbr> and most browsers don't read it as <abbr title="eXtensible Markup Language"><span class="caps">XML</span></abbr>, but that's a different article for a different day.  Today, we're using <a href="http://www.w3.org/TR/xhtml1/cover.html#minitoc" title="The Official W3C XHTML 1.0 Specification...learn it, live it, love it...just kidding, it these things read like some other language, but it's useful to know they're there."><span class="caps">XHTML</span> 1.0 Strict</a> because the client insists that we use the latest technology regardless of whether or not it's appropriate; so this is what the <span class="caps">DOCTYPE</span> definition for <a href="http://www.w3.org/TR/xhtml1/cover.html#minitoc" title="The Official W3C XHTML 1.0 Specification...learn it, live it, love it...just kidding, it these things read like some other language, but it's useful to know they're there."><span class="caps">XHTML</span> 1.0 Strict</a> looks like:</p>

{% render_gist https://gist.github.com/raw/885585/82456fac59c7ae039405155ca812e3267f09624a/in-beginning-there-was-doctype.first.html %}

<p>Remember, that's the very first line of your&nbsp;file!</p>
<p>Next, let's get the basic xhtml in there:</p>

{% render_gist https://gist.github.com/raw/885585/9e7d645a679016c958cad317c5fc4202918a0e65/in-beginning-there-was-doctype.second.html %}

<p>Next, let's get some very basic <abbr title="Search Engine Optimization"><span class="caps">SEO</span></abbr> framework in there and add some meta elements. Meta elements are sometimes called meta tags, but since we're working in an <abbr title="eXtensible HyperText Markup Language"><span class="caps">XHTML</span></abbr> document we'll use the <abbr title="eXtensible Markup Language"><span class="caps">XML</span></abbr> terminology.  We'll use description and keywords, and throw author in the for good taste.</p>

{% render_gist https://gist.github.com/raw/885585/2ae6352ea77402c424c2a55258a460fac7af9b6b/in-beginning-there-was-doctype.third.html %}

<p>Great, now there's a place for keywords and a description, but why do we need them? Keywords are old-school, I don't even know if modern crawlers still look at them, but I do know that like all meta elements they should be specific for the page you're writing them for.  So, as a means of guiding my <abbr title="Search Engine Optimization"><span class="caps">SEO</span></abbr>, I usually choose the 5-10 keywords that I want to apply to my current page, then make sure that as I'm writing the page copy I use those&nbsp;keywords.</p>
<p>The description meta element is slightly different, because it's visibly used.  It is displayed by some search engines as a description of your page when it occurs as a result.  As a guide to writing a description, keep it short, around 128-256 characters.  Keep in mind that if it's too long it will most likely by truncated, so just write a sentence describing the current&nbsp;page.</p>
<p>Now, we'll have a look at the page title:</p>

{% render_gist https://gist.github.com/raw/885585/54fa800156d7d7026baf439c6ce5a6a4adfeba08/in-beginning-there-was-doctype.fourth.html %}

<p>Like the meta description, the title element is displayed as part of a search result list, so a descriptive title can be very helpful for drawing users into your site.  Some <abbr title="Search Engine Optimization"><span class="caps">SEO</span></abbr> experts also believe that keywords in your title are more heavily weighted in search rankings.  Keep the title shorter than your description, and maybe consider including your branding at the end.  I like the branding at the end because if it does get truncated by the search engine more of my more important descriptive title is&nbsp;displayed.</p>
<p>Finally, let's add the stylesheets:</p>

{% render_gist https://gist.github.com/raw/885585/97636729211894478563debbe776c4a69bb19fce/in-beginning-there-was-doctype.fifth.html %}

<p>Now I'm a bit of a purist, and I'll have a later post describing my process for styling a page, but notice for now, I usually have a minimum of two stylesheets.  The first being a clean stylesheet (as in <strong><span class="caps">NO</span> Hacks/Filters/Whatever you like to call them</strong>) that handles all of the (mostly) standards complaint browsers, then an <a href="http://msdn.microsoft.com/workshop/author/dhtml/overview/ccomment_ovw.asp" title="Learn the details about conditional comments from the reason why you need them.">Internet Explorer conditional comment</a> for handling older versions of <abbr title="Internet Explorer"><span class="caps">IE</span></abbr>.  In this case, my iefix stylesheet is for <code>lte IE 6</code> which translates to <q>Less than or equal to Internet Explorer 6.</q> Notice that the iefix stylesheet comes <strong>after</strong> the other stylesheet(s), this is so that any rules in the iefix stylesheet with equal or greater <abbr title="Cascading Style Sheet(s)"><span class="caps">CSS</span></abbr> specificity will overwrite the rules in the standard stylesheet.  (More on specificity in a later&nbsp;post.)</p>
<p>That's it!  Congratulations, you have a nice, clean base to start your web 2.0 website on!  If you're curious, the finished product looks something like this:</p>

{% render_gist https://gist.github.com/raw/885585/2ae0fb05e1d727392a1d3dae828d2b82aef5f101/in-beginning-there-was-doctype.sixth.html %}