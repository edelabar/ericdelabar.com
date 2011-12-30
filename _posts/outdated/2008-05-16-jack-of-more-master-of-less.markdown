---
layout: post
title: Jack of Even More Trades, Master of Even Less by Eric DeLabar
metadesc: 
class: post disclaimer
changefreq: never
priority: 0.4
category: outdated
---
# Jack of Even More Trades, Master of Even Less?

I've been at my current employer for over four years.  We do Java-based web application development.  Four short years ago, 
this industry was a different world.  [Web 2.0](http://en.wikipedia.org/wiki/Web_2.0) didn't exist. 
[Ajax was a cleaning product](http://en.wikipedia.org/wiki/Ajax_%28cleanser%29).  A website that only worked in 
IE 6 was good enough for most clients.  Tables were a viable solution of any HTML 
markup problem, and the [semantic web](http://en.wikipedia.org/wiki/Semantic_web) had something to do with 
[a children's book about a pig](http://en.wikipedia.org/wiki/Charlotte%27s_Web).  Four short years ago we were the 
Jacks of all web-application development and we had it mastered.

When I started here our tech stack was pretty small, we wrote 
[J2EE](http://en.wikipedia.org/wiki/Java_EE) applications and we deployed them to 
[WebSphere Application Server (WAS)](http://en.wikipedia.org/wiki/WebSphere_Application_Server). 
We wrote these applications using [WebSphere Studio Application Developer (WSAD)](http://en.wikipedia.org/wiki/IBM_Websphere_Studio_Application_Developer) 
using a home-brew framework of <abbr title="Gang of Four">[GoF](http://en.wikipedia.org/w/index.php?title=Gang_of_Four_%28software%29&amp;redirect=no)</abbr>
patterns and JSP scriptlets.  JSTL was just entering the scene and 
JavaScript was a dreaded task used only for fly-overs and submitting forms with more than one possible action. 
CSS was used for changing font sizes and a table-based layout was not just the norm, it was expected. 
SEO was using alt attributes on your image element.  You could learn this stack in a few weeks while 
studying for your [SCJP](http://en.wikipedia.org/wiki/SCJP) cert, be a useful resource 
on small tasks in a month, and be the lead architect of major subsystems in six.  A true master in six short months.

For this career, at least here, a B.S. in computer science was required (emphasis on the 
BS), but that just got you through the door.  Everything else you needed to know you learned in the 
first six months to a year.  You learned how to read code.  You learned how to search Google for solutions.  You learned how 
to search the CVS repository for the way we solved it last time for some other client.  More 
importantly you learned how to learn.

Now, here we are four years later, the Web has reached its next version, and discussion has started on 
[the one after that](http://en.wikipedia.org/wiki/Web_3.0).  Our tech stack is now outlined on a four-page spreadsheet. 
Home-brew pattern implementations are now a thing of the past.  We have [Spring for IoC and MVC](http://www.springframework.org/) on the middle tier.  [Hibernate](http://www.hibernate.org/), 
[JPA](http://java.sun.com/developer/technicalArticles/J2EE/jpa/), 
[iBatis](http://ibatis.apache.org/) and 
[JDBC](http://en.wikipedia.org/wiki/Java_Database_Connectivity) for 
DB persistence, plus [web services](http://en.wikipedia.org/wiki/Web_services) 
and [SOA](http://en.wikipedia.org/wiki/Service-oriented_architecture), and even a little 
[JCR](http://en.wikipedia.org/wiki/Java_Content_Repository).  The view is now at least 
JSP/JSTL, sometimes [Velocity](http://velocity.apache.org/), 
sometimes even [JSF](http://java.sun.com/javaee/javaserverfaces/), and they just generate 
the markup.  CSS is a part of life, tables are for data only, and we sometimes write more JavaScript 
for a project than we do Java.  We deploy to [WAS](http://www-306.ibm.com/software/webservers/appserv/was/), 
[WAS CE](http://www-306.ibm.com/software/webservers/appserv/community/) 
([geronimo](http://geronimo.apache.org/)), 
[Tomcat](http://tomcat.apache.org/), 
[JBoss](http://www.jboss.org/), 
[WebLogic](http://www.bea.com/weblogic/), and insanely configured combinations of them all.  We develop in 
[Rational Application Developer](http://www.eclipse.org/">Eclipse</a>, <a href="http://www-306.ibm.com/software/awdtools/developer/application/), 
[IntelliJ IDEA](http://www.jetbrains.com/idea/), and we might even try 
[NetBeans](http://www.netbeans.org/).  We test on IE 6 and 7, Firefox and Safari, we test 
with and without JavaScript.  We advise clients on search engine marketing, social networking, tag clouds, URL 
rewriting, [XML sitemaps](http://www.sitemaps.org/), feeds, 
[microformats](http://microformats.org/), link building, link bait, and duplicate content, not to mention semantic 
HTML with a clean structure and accessible markup.  We do automated 
[integration tests](http://en.wikipedia.org/wiki/Unit_test">unit</a> and <a href="http://en.wikipedia.org/wiki/Integration_testing), 
performance testing, [code coverage](http://en.wikipedia.org/wiki/Code_coverage) reports, and are discussing a 
[continuous build server](http://en.wikipedia.org/wiki/Continuous_Integration).

Our training program remains basically the same.  We simply throw more words at the newbies and hope they'll take the initiative 
to at least look them up.  Now they can write unit test and perform AJAX calls, but they don't know 
how to methodically test a simple web form submission.  They avoid SQL, especially on a terminal. 
They regularly check broken code into CVS or foobar a code-sync to the point that work has to stop 
for hours to clean it up.  They have even mastered the ability to create unit tests that provide 100% code coverage but don't 
actually test that anything works.  They know enough about the technology stack to be **literally dangerous**.

How do you train people for Web 2.0?  I could write and teach a year-long course that covers all of the technologies, but I'm 
beginning to doubt it would matter, and they'd never take me off of the projects that actually make money to teach it for that 
long.  I'm sad to say, but I don't think the problem is the training, I think it's the mentality.  You went through college, 
you know how to write code.  If you know how to learn, the size of the tech-stack shouldn't matter.  The tech-stack makes you 
life easier if you learn how to use it.  You don't learn Web 2.0 from a book or a class, you learn it by living it.  You want 
to design web apps, where's your website?  At least tell me about your idea for the next killer web-app.  You want to write code?  
Show me.  What open-source project(s) do you contribute to? 
Write an [awesomely bad and ironic implementation of the fizz-buzz](http://gilesbowkett.blogspot.com/2007/03/sarcastic-fizzbuzz.html) 
problem and explain to me with a smile on your face why you did it.  Tell me why [Joel](http://www.joelonsoftware.com/) 
is your new religious leader, how [Zeldman](http://www.zeldman.com/) and [Meyer](http://meyerweb.com/) are 
your preferred deities.  Try and convince me that the [CSS Zen Garden](http://www.csszengarden.com/) 
is bad, or voice your opinion on the 
[IE 8 version-targetting debate](http://alistapart.com/issues/251).  Show me you have passion. 
I'm tired of code-monkeys, show me you're a rock star.

*Smashes keyboard, steps down off the soap box, walks off stage.*

But seriously, is it that much different?  We still have the same GoF patterns, we just use somebody else's named, branded, and 
marketed implementation.  Web 2.0 is just doing the web the right way, it's using now-established best practices that were still 
being invented four years ago.  We can still be the masters of all things java web-app development, we just need to continue 
reading and learning.  So how do we make the next generation of masters?  To that I say you can't.  You need to find them.  You 
need to find the people that have the pre-bubble mentality, the people with the passion and drive to love this stuff.  Those 
people can be groomed to masters simply by showing them where to look.  As for the others?  Teach them how to use source control. 
Teach them how to test a web-form.  Teach them just enough html to make something look the way the client wants it to in 
IE.  After that, let them work on the .Net and JSF drag-and-drop 
component-based development.  Let them build boring intranet applications that can run on IE 6 until the 
ancient machines they were designed for finally die.  Let them stagnate in the Web 1.0 mentality, and when they're obsolete, get 
them out of the way.
