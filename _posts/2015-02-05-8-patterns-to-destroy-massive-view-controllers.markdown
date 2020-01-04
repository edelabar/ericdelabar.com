---
layout: post
title: 8 Patterns to Help You Destroy Massive View Controllers
metadesc: A link to an excellent article on design patterns to make smaller, more testable UIViewControllers.
class: post
changefreq: never
priority: 0.7
categories: [cocoa,design-patterns,bookmark]
---

I'm a little late to the party on [this one](http://khanlou.com/2014/09/8-patterns-to-help-you-destroy-massive-view-controller/), but it has a few tips for creating smaller, more unit-testable view controllers.

> View controllers become gargantuan because they’re doing too many things. Keyboard management, user input, data transformation, view allocation — which of these is really the purview of the view controller? Which should be delegated to other objects? In this post, we’ll explore isolating each of these responsiblities into its own object. This will help us sequester bits of complex code, and make our code more readable.

I'm a huge fan of smaller view controllers, and [this objc.io article](http://www.objc.io/issue-1/lighter-view-controllers.html) was always my go-to starting point.  However, [Soroush Khanlou](http://khanlou.com/)'s [8 Patterns to Help You Destroy Massive View Controller](http://khanlou.com/2014/09/8-patterns-to-help-you-destroy-massive-view-controller/) is my new favorite step two.  It covers 8 design patterns that help you break up your code into smaller, easier-to-understand chunks.

(I've just discovered Soroush's site and his articles all look great; I think I'll be spending a little time in his archives!)