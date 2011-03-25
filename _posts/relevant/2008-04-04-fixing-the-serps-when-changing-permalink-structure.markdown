---
layout: post
title: Fixing the SERPs When Changing Permalink Structure in WordPress by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
<h1>Fixing the SERPs When Changing Permalink Structure in WordPress</h1>
<p>As of today, if you run a Google search to see what pages of my site are in the index you'll find quite a bit.  However, the pages in the index reflect a <span class="caps">URL</span> structure that I'm not thrilled with for <abbr title="Search Engine Optimization"><span class="caps">SEO</span></abbr> reasons.  In order to remedy this problem I did some playing with Google's webmaster tools and my .htaccess file.  As of today we're going to employ some 301 redirects to get the <abbr title="Search Engine Results Page"><span class="caps">SERP</span></abbr>'s pointing in the right place, remove some old pages from the index, and modify my robots.txt.  Hopefully these changes will concentrate my search results to show off the real content of this site and lose some of the fluff.  Along the way, we're also going to find out how long it takes for these corrections to take&nbsp;place.</p>
<p>First things first, here's the problem, if I do a google site search like this <code>site:www.ericdelabar.com</code> I get results that look like&nbsp;this:</p>
<p><img src="images/serp.gif" alt="serp.gif" border="0" width="559" height="557" class="clear"></p>
<p>Notice the entries that look something like <code>www.ericedelabar.com/?cat=11</code>?  They all work, but they're not ideal for <abbr title="Search Engine Optimization"><span class="caps">SEO</span></abbr>, so first things first, the <code>.htaccess</code>&nbsp;file.</p>

{% render_gist https://gist.github.com/raw/885179/f030d8edd3e0cf45a9bfa6cea8979d7c006d7c4c/fixing-the-serps-when-changing-permalink-structure.htaccss.txt apache %}

<p>Each line in the file is a rule, the <code>redirect</code> is the command, the number is the type, which in this case is 301, which means Òmoved permanently,Ó the original URL comes next, and then finally the desired URL. Looking at my list, I have two basic redirects here, redirects to convert from category id to the category name, and redirects to convert from post id to post slug.  These lines <strong>must</strong> be before the <code># BEGIN WordPress</code> comment in your .htaccss file, if they are not, they will not&nbsp;work.</p>
<p>Now that categories and posts are redirecting, there is one final problem, the last few pages of results contain quite a few search result pages.  These pages have a <span class="caps">URL</span> pattern something like the following: <code>http://www.ericdelabar.com/index.php?s=firebug</code>.  I don't really want my search result pages in the SERPs, but I'm not ready to get rid of them all yet.  To remedy this I simply installed the <a href="http://wordpress.org/extend/plugins/search-permalink/">Search Permalink</a> plug-in which redirects the <code>?s=keyword</code> pattern to <code>/search/keyword/</code>, which is not perfect, but looks a little nicer than the query string.  In the long run I will probably remove them from the SERPs altogether, but I haven't decided on my search strategy for this site yet, so I'll leave that for another&nbsp;day.</p>
<p>Next we want to keep Google out of the site admin, so we add the WordPress login page and admin section to the <code>robots.txt</code> file by adding the following&nbsp;lines.</p>

{% render_gist https://gist.github.com/raw/885179/c0648d820983abf230e4b59e06d9ddd0a8be93ac/fixing-the-serps-when-changing-permalink-structure.robots.txt text %}

<p>Next, we're going to use the Google Webmaster Tools to remove the wp-login and wp-admin pages from the index.  This requires that the pages have either a robots.txt file disallowing them or a robots metatag with <code>noindex</code> specified.  Since our robots.txt file should handle this, our request should look like the&nbsp;following:</p>
<p><img src="images/remove-page.gif" alt="remove_page.gif" border="0" width="1014" height="464" class="clear"></p>
<p>Finally, we resubmit the site for crawling and hope that this gets cleared up within a few&nbsp;days.</p>
<p>Now this methodology only specifically addresses Google, my site has also been indexed in <span class="caps">MSN</span>, Yahoo, and Ask, and steps will have to be taken to resolve these as well, but fixing Google is definitely a good&nbsp;start!</p>