---
layout: post
title: Let’s talk about tools - Part 2 by Eric DeLabar
metadesc: 
class: post
changefreq: never
priority: 0.9
category: relevant
---
# Let’s talk about tools - Part 2

Continuing our [thread on tools](/2008/02/lets-talk-about-tools-part-1.html" title="Let's talk about tools — Part 1), 
we’re now going to have a look at setting up a simple test server environment.

As I explained last time, I typically develop on a Windows and Linux, so I prefer a tool that works well on both platforms. 
Coming from a Java development background, there is one tool that meets this requirement, and more; and as you may or may 
not know, works with more than just Java.  That tool is of course, the [Eclipse Framework](http://www.eclipse.org/), 
a Java-based development platform.

Out of the box, Eclipse provides the hooks necessary to support helpful features such as syntax highlighting and code-completion; 
with the help of a variety of plug-ins you can very easily enable these features for Ruby, PHP, Perl, 
C, or pretty much whatever language you prefer to develop in. For this tutorial, we’re just going to get the basic 
<acronym title="HyperText Markup Language">HTML</acronym>, 
<acronym title="Cascading Style Sheets">CSS</acronym>, and JavaScript editors installed and configured.

Start off by [downloading the latest version of the Eclipse Framework](http://www.eclipse.org/downloads/), 
at the time of this writing, that was 3.2.2.  To install it, simply unzip it to your hard drive; to make your life 
easier, drop it in the root of a drive (i.e. <kbd>c:\</kbd>). (Make sure you have a JDK/JRE installed, if you don’t, 
grab the [latest from Sun](http://java.sun.com/javase/downloads/index.jsp).) Once installed, start it up 
by running <kbd>eclipse.exe</kbd> (just press OK at the Workspace Launcher prompt for now) and go directly to the 
<kbd>Help &gt; Software Updates &gt; Find and Install...</kbd> menu.  Select the <kbd>Search for new features to install</kbd> 
radio button and press <kbd>Next &gt;</kbd>.  Check the box to search the <kbd>Callisto Discovery Site</kbd> and press 
<kbd>Finished</kbd>.  On the next screen, expand the <kbd>Callisto Discovery Site</kbd> node, and then expand the 
<kbd>Web and J2EE Development</kbd> node.  Check the box for the following nodes:

* <kbd>Graphical Editors and Frameworks</kbd>
	* <kbd>Graphical Editing Framework</kbd>
* <kbd>Models and Model Development</kbd>
	* <kbd>Eclipse Modeling Framework (EMF) Runtime + End-User Tools</kbd>
	* <kbd>XML Schema Infoset Model (XSD) Runtime + End-User Tools</kbd>
	* <kbd>Java EMF Model</kbd>
* <kbd>Web and J2EE Development</kbd>
	*<kbd>Web Standard Tools (WST) Project</kbd>

Read and accept the license agreements and press <kbd>Next &gt;</kbd>.  Press the <kbd>Finish</kbd> button, and let it do 
its thing.  If you receive a Verification window, press the <kbd>Install All</kbd> button.  When prompted to restart Eclipse, 
select cancel, and close Eclipse.  Congratulations, Eclipse is installed and now we’re ready to install 
[Apache HTTP Server](http://www.apache.org/httpd/).

You may be wondering why it’s necessary to install an <acronym title="HyperText Transfer Protocol">HTTP</acronym> 
server when you can open an HTML file directly from the file system in most browsers.  The simple 
answer is because this is a development environment and the code you produce locally should run on the server without 
modification.  With some site file system layouts, paths, such as those to images or stylesheets, may be different on the 
server compared to your local machine, especially if using URL rewriting techniques.  As a benefit 
for more advanced users, you can also configure apache to run PHP, Perl, or the server side language 
of your choice.  Now, back to our tutorial.

First, [download the latest version of Apache](http://httpd.apache.org/download.cgi). (We’re assuming you’re on 
Windows here, if you’re using an alternative <acronym title="Operating System">OS</acronym>, this 
exercise is left to you…)  At the time of this writing, the best version is 2.2.4 and Win32 Binary 
(<acronym title="MicroSoft Installer">MSI</acronym> Installer) is probably the easiest to deal with. 
After it’s downloaded, run the installer.  The install process is pretty standard; for server information you probably 
want to use <kbd>localhost</kbd> for your Network Domain, unless your desktop has a fully qualified domain name, and your 
machine name for Server Name, on the Server Information screen.  From that point, the Typical install will probably do 
just fine.  When it’s finished, Apache will be conveniently started, and you’ll be ready to move on.  To test your result, 
load up a browser and check out: [http://localhost/](http://localhost/ "A link to the local machine, which by now is hopefully running Apache HTTPd"); 
if it worked, your browser will display an oh-so-descriptive page stating “It works!” Now that you have a working web server, 
let’s create a convenient shortcut to open Eclipse in the <kbd>htdocs</kbd> directory of Apache.

Browse to your Eclipse install directory (probably something like: <kbd>c:\eclipse</kbd>) and right-click on <kbd>eclipse.exe</kbd>. 
Choose <kbd>Create Shortcut</kbd> from the context menu.  Rename it to “Apache HTTP Server Workspace” and drag it someplace 
convenient (like your desktop.)  Right click on the Shortcut and change the Target field to look something like this: 
<kbd><i>C:\eclipse\</i>eclipse.exe -data "<i>C:\Program Files\Apache Software Foundation\Apache2.2\</i>htdocs"</kbd>, 
where the italic text is replaced by your Eclipse install directory and Apache install directory respectively. Press 
<kbd>OK</kbd> to save your changes.  Now start up Eclipse by running your new shortcut, and you should not be prompted 
to choose a Workspace.  Congratulations, Eclipse is now configured, now let’s get a project setup and give a quick tour 
of the Eclipse functionality.

To clear the Welcome screen, press the “X” on the Welcome tab at the top of the screen.  By default, you’ll be setup in 
the Java Perspective, this won’t be of much help unless you’re a Java developer, so choose the <kbd>Window &gt; Open Perspective &gt; Other...</kbd> 
menu.  Choose the Resource perspective from the list and press <kbd>OK</kbd>.  The screen layout will change and should 
now show the <kbd>Navigator</kbd>, <kbd>Outline</kbd>, and <kbd>Tasks</kbd> views (counter-clockwise from upper left.) 
Right click on the Navigator view, and select <kbd>New &gt; Project...</kbd> from the context menu.  From the Wizards 
tree, expand <kbd>Web</kbd>, and select <kbd>Static Web Project</kbd> and press the <kbd>Next &gt;</kbd> button.  In 
the project name box, type an appropriate name for your current project, in this example we’ll use <kbd>demo</kbd>, and 
press <kbd>Finish</kbd>.  A new folder will appear in the Navigator view and inside of it will be a variety of folders 
and files, don’t worry too much about any of them, but you can get rid of the “WebContent” directory.  This directory is 
now a subdirectory off of your localhost root directory (i.e. [http://localhost/demo/](http://localhost/demo/).) 
Just to verify, create a new HTML document named index.html (Hint: try the <kbd>New</kbd> context 
menu off of the “demo” folder in the Navigator view view again) and paste the HTML from my [second article](http://blog.ericdelabar.com/2007/02/in-beginning-there-was-doctype.html) 
into that file.  Next, load it up and the server and inspect your handy work! (Try: 
[http://localhost/demo/](http://localhost/demo/), it’s an oh-so-exciting blank page with a title. Hooray!)

That’s it!  In my next article, I’ll take a look at setting up a simple directory structure and making more than just 
an empty web page.

