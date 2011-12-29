---
layout: post
title: Fixing the SERPs When Changing Permalink Structure in WordPress by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Fixing the SERPs When Changing Permalink Structure in WordPress

As of today, if you run a Google search to see what pages of my site are in the index you'll find 
quite a bit.  However, the pages in the index reflect a URL structure that 
I'm not thrilled with for <acronym title="Search Engine Optimization">SEO</acronym> 
reasons.  In order to remedy this problem I did some playing with Google's webmaster tools and my 
.htaccess file.  As of today we're going to employ some 301 redirects to get the 
<acronym title="Search Engine Results Page">SERP</acronym>'s pointing in the right place, 
remove some old pages from the index, and modify my robots.txt.  Hopefully these changes will concentrate 
my search results to show off the real content of this site and lose some of the fluff.  Along the way, 
we're also going to find out how long it takes for these corrections to take place.

First things first, here's the problem, if I do a google site search like this `site:www.ericdelabar.com` 
I get results that look like this:

<img src="images/serp.gif" alt="serp.gif" border="0" width="559" height="557" class="clear">

Notice the entries that look something like `www.ericedelabar.com/?cat=11`?  They all work, but they're not ideal for 
<acronym title="Search Engine Optimization">SEO</acronym>, so first things first, the `.htaccess` file.

{% render_gist https://gist.github.com/raw/885179/f030d8edd3e0cf45a9bfa6cea8979d7c006d7c4c/fixing-the-serps-when-changing-permalink-structure.htaccss.txt apache %}

Each line in the file is a rule, the `redirect` is the command, the number is the type, which in this 
case is 301, which means "moved permanently," the original URL comes next, and then finally the desired URL. 
Looking at my list, I have two basic redirects here, redirects to convert from category id to the category name, 
and redirects to convert from post id to post slug.  These lines **must** be before the `# BEGIN WordPress` 
comment in your .htaccss file, if they are not, they will not work.

Now that categories and posts are redirecting, there is one final problem, the last few pages of results contain 
quite a few search result pages.  These pages have a URL pattern something like the following: 
`http://www.ericdelabar.com/index.php?s=firebug`.  I don't really want my search result pages in the SERPs, 
but I'm not ready to get rid of them all yet.  To remedy this I simply installed the 
[Search Permalink](http://wordpress.org/extend/plugins/search-permalink/) plug-in which redirects the 
`?s=keyword` pattern to `/search/keyword/`, which is not perfect, but looks a little nicer 
than the query string.  In the long run I will probably remove them from the SERPs altogether, but I haven't 
decided on my search strategy for this site yet, so I'll leave that for another day.

Next we want to keep Google out of the site admin, so we add the WordPress login page and admin section to the 
`robots.txt` file by adding the following lines.

{% render_gist https://gist.github.com/raw/885179/c0648d820983abf230e4b59e06d9ddd0a8be93ac/fixing-the-serps-when-changing-permalink-structure.robots.txt text %}

Next, we're going to use the Google Webmaster Tools to remove the wp-login and wp-admin pages from the index. 
This requires that the pages have either a robots.txt file disallowing them or a robots metatag with 
`noindex` specified.  Since our robots.txt file should handle this, our request should look like the following:

<img src="images/remove-page.gif" alt="remove_page.gif" border="0" width="1014" height="464" class="clear">
	
Finally, we resubmit the site for crawling and hope that this gets cleared up within a few days.

Now this methodology only specifically addresses Google, my site has also been indexed in MSN, 
Yahoo, and Ask, and steps will have to be taken to resolve these as well, but fixing Google is definitely a good start!
