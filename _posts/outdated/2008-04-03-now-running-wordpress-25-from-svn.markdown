---
layout: post
title: Now running WordPress 2.5 from SVN by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
# Now running WordPress 2.5 from SVN

Since I found out that [HappyCog](http://www.happycog.com/) 
[redid the admin for WordPress 2.5](http://www.jasonsantamaria.com/archive/2008/03/31/wordpress_admin_redesign.php) 
I've been interested to see what it looks like.  This morning I decided it was time.  I originally used the 
[DreamHost](http://www.dreamhost.com/r.cgi?146279) 
[one-click install](http://wiki.dreamhost.com/One_Click_Installs) to setup my initial install, and although it 
is a nice feature, I decided that [SVN was more my thing](http://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion). 
[Going through the steps provided was pretty simple](http://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion#Converting_a_.22Traditional.22_WordPress_Blog_to_a_Subversion_Checkout), 
and my upgrade was complete in about five minutes total.

As far as compatibility, all of my existing plugins "worked" but the 
[XML Sitemap plug-in](http://www.arnebrachhold.de/projects/wordpress-plugins/google-xml-sitemaps-generator/) 
looks a little funny thanks to the new admin design.  While I was at it I added the 
[ClickPass plugin](http://www.clickpass.com/docs/wordpress-plugin) as a follow-up to 
[my recent foray into OpenID](/2008/04/identity-and-openid.html).  I'm not sure it's working correctly, I can login 
with my ClickPass account (which I'm assuming is cookie based), but have been unsuccessful merging my 
<a href="http://openid.delabar.org/eric" rel="me">preferred OpenID</a>, or even the one 
<a href="http://www.technorati.com/people/technorati/edelabar" rel="me">Technorati</a> provides.  
I will have to look into that one a little further, but until then, no ClickPass for me.
