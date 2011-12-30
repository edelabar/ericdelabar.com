---
layout: post
title: Duck Punching JavaScript - Metaprogramming with Prototype by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Duck Punching JavaScript - Metaprogramming with Prototype

First, let me explain the title for those of you who live in Java world.  The term Duck Punch comes from 
Ruby programmers and refers to the concept of [duck typing](http://en.wikipedia.org/wiki/Duck_typing) 
used by Ruby and other languages; <q>if it walks like a duck and quacks like a duck, I would call it a duck.</q> 
With that being said, [duck punching is summed up nicely by Patrick Ewing with the following](http://en.wikipedia.org/wiki/Monkey_patch):

> Well, I was just totally sold by Adam, the idea being that if it walks like a duck 
> and talks like a duck, it's a duck, right? So if this duck is not giving you the 
> noise that you want, you've got to just punch that duck until it returns what you expect.

It is slightly violent, but makes for a good article title.  Now, getting to the point, 
<cite>[metaprogramming](http://en.wikipedia.org/wiki/Metaprogramming)</cite>
is writing programs that write or manipulate programs, including themselves, at runtime. 
This type of programming can be accomplished in many languages but is currently a pretty 
hot topic in languages such as [Ruby](http://www.ruby-lang.org/) and 
[Groovy](http://groovy.codehaus.org/).  Java has a similar concept known as 
[Aspect Oriented Programming (<acronym title="Aspect Oriented Programming">AOP</acronym>)](http://en.wikipedia.org/wiki/Aspect_Oriented_Programming), 
which introduces [pointcuts](http://en.wikipedia.org/wiki/Pointcut) to a 
program that can then be modified at runtime via bytecode manipulation or dynamic method 
proxies. 

My example library/method below allows a [Prototype](http://www.prototypejs.org/)-enabled 
class to have every one of its methods wrapped with a before and/or after method to introduce additional 
functionality at runtime.  This concept is demonstrated by 
[this example](http://www.ericdelabar.com/examples/metaprogramming-javascript/index.html), 
note that the modification occurs on the class level and any existing or future instances of that class 
are affected.  Thanks to [Prototype JS](http://www.prototypejs.org/), 
this code is pretty simple:

{% render_gist https://gist.github.com/raw/885501/bb61ff75f9316bb53f09f74ef1838c9bfc0e223e/metaprogramming-javascript.js %}

This code relies on one of the core concepts of JavaScript <acronym title="Object Oriented Programming">OOP</acronym>; 
a JavaScript object is nothing more than an associative array.  Knowing this, when passed a class, we can 
get a list of all class member names using the Prototype [ `Object.keys` method](http://www.prototypejs.org/api/object/keys) 
as shown on line 4.  Once we have the member names, we loop through all members (line 5) of the class. 
For each member we check if it [is a function](http://www.prototypejs.org/api/object/isfunction) (line 7). 
If it is, we alias the function (line 9) and create a new function (line 10) in its place that wraps the aliased function 
with calls to the before (line 11) and after (line 20) functions we pass in.  Notice the use of  `clazz.prototype` 
starting on line 9, the  `prototype` keyword is necessary to modify the class.  If you rewrote this method 
slightly and didn't specify the  `prototype` keyword you could modify an individual instance of the class 
instead of all running instances.  Also notice the [`curry` method](http://www.prototypejs.org/api/function/curry) 
on line 16, [currying is a metaprogramming technique](http://en.wikipedia.org/wiki/Currying) (provided as a helper 
by Prototype JS) where a function is modified with each call so that the arguments passed into it 
become part of the function and are no longer necessary.  This allows us to pass an arbitrary number of arguments into the 
aliased method.  (Remember, in JavaScript, arguments do not need to be defined for a function and can be accessed via the 
arguments array.)

The above code can be called on any class in the document by running the following code, assuming before and after are 
pre-existing functions and SampleClass is the desired class:

{% render_gist https://gist.github.com/raw/885501/6030ba1b786227dccc10c052d88a8eb1ef03adfb/metaprogramming-javascript.usage.js %}

You can see a complete (although pretty useless) [example of this method here](http://www.ericdelabar.com/examples/metaprogramming-javascript/index.html), 
or view the source code for [the test](http://www.ericdelabar.com/examples/metaprogramming-javascript/test.js) or the 
[sample class](http://www.ericdelabar.com/examples/metaprogramming-javascript/sampleClass.js).

So, where is this useful?  Since we're simulating AOP, we can use this for any 
[cross-cutting concern](http://en.wikipedia.org/wiki/Cross-cutting_concern), a perfect example being logging 
or profiling.  Watch for a future article where I use this technique to automatically implement 
<a href="http://www.ericdelabar.com/2008/04/javascript-getelementbyid-performance.html">JavaScript profiling similar to what 
I did in my article on the dollar function</a> using this technique.  One final note for the Prototype geniuses out there, 
Prototype does provide a [ `wrap` method](http://www.prototypejs.org/api/function/wrap) that provides 
this functionality, but if you used that you never would have learned all the neat things about JavaScript in this example!
