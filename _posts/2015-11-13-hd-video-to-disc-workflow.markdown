---
layout: post
title: HD Video to Blu-Ray and DVD Mac workflow
metadesc: How I get HD video from my phone or camera to a Blu-Ray or DVD with chapters on El Capitan.
class: post
changefreq: never
priority: 0.7
categories: [video]
---

Since Apple killed iDVD with the on-board optical drive I've been looking for a way to archive HD video onto a optical disc for archival purposes.  Streaming is nice, but I don't have the disk space for dozens of multi-gig videos to just sit around until I'm feeling nostalgic, and I often need or want to share a video with multiple people who aren't technically savvy enough to stream it to their TV.  I present this simple Mac-based workflow to build a no-nonsense Blu-Ray or DVD with chapters.

This is not a free workflow, it's probably possible to do it, but I'm going for easy, and if that means spending a few bucks I'm willing to do it.  I use Toast 11 Titanium with the Blu-Ray plugin to burn ([You can get Toast 14 Pro](http://www.roxio.com/enu/products/toast/pro/) to do the same) on an <a rel="nofollow" href="http://www.amazon.com/gp/product/B00HW7LQ6G/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B00HW7LQ6G&linkCode=as2&tag=ericdcom0e-20&linkId=ICM2STM7YLQFYKGZ">OWC Mecury Pro Blu-Ray burner</a><img src="http://ir-na.amazon-adsystem.com/e/ir?t=ericdcom0e-20&l=as2&o=1&a=B00HW7LQ6G" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> and a tool called [mChapters](https://itunes.apple.com/us/app/mchapters/id563131976?at=11lSh6&mt=12) from the App Store to set the chapter markers.

I edit in iMovie, usually on my Mac, but it also works great on my iPhone or iPad if that's where the video is coming from.  I prefer the Simple theme, but that's personal preference.  When I'm done editing, I export to a file. I set the resolution to the highest possible for the source clips, the quality to "High" and compress to "Better Quality."

While the file is exporting I find my chapter times.  In general, I set chapters to the center of each transition in my movie.  As of the latest version of iMovie, you can find the time by setting the selection point in the middle of a transition and noting the time.  The Simple theme uses a fade through black transition, so in general I grab the time for the black frame.

At this point we could move straight into Toast, but Toast 11's chapter editor is terribly slow and hard to use.  Roxio may have fixed it since, but I have version 11 so I set my chapters with mChapter.  As a benefit, when the chapters are set on the file itself you don't need to re-set them if you're creating both a Blu-Ray and a DVD, which Toast 11 will make you do when you create a new project with a new disc type.

When the export is done I rename the file from the default .mp4 extension to .m4v.  This is important, Toast will **not** read chapters from an mp4 file, but it will form an m4v.  Open up the video in mChapters, go to the "Markers" menu and select "Add Text Track."  Set the Language of your video track to your language and the Language of the text track to the same, set the video track's Chapter Reference to the name of your text track.  (It defaults to "Text".) Select the Text track, you'll notice Chapter 1 is provided for you, leave it alone, you need a chapter 1 at timecode 00:00:00.0000 for everything to work.  

Use the video preview and scrubber on the right to find the location of your next chapter marker.  Notice the jump ahead/back 5 and 30 second buttons, these are useful.  The >> and << buttons jump about 1/100 of a second at a time, and you can hold them to fine-tune your selection.  If you want to be extra-precise, the > and < buttons are there to enable it, but I generally don't bother.  The buttons are nice, but on a multi-touch trackpad a two-finger scroll is much faster and amzingly precise.  I highly recommend it.  Since the timecode from iMovie is only accurate to the second, it's only good as a starting point, once I'm roughly there in the preview window I fine-tune by looking for the black frame in the middle of the fade-through-black transition.

Once you have the location for you chapter dialed in, press the + icon in the lower-left of the window.  This sets the chapter.  You can set the title if you want, I do to keep track of where I am in the file, but Toast 11 ignores it.  Repeat this process until all of your chapters are set.  At that point, save the file so your chapter track is included.

Open up Toast and select the disc type you're planning on burning, Toast will convert the video appropriately, so you can burn a regular DVD with a 1080p m4v file.  Drag you video file into Toast click the edit button for the video and verify that the chapters are set in the chapters tab, they should be.  (You renamed the file to .m4v right?)  Play with the menu and encoder settings if you like, I set the encoder to be the best quality, and generally use no menus.  

When everything is configured the way I like I burn an image, this might be technical superstition dating back to the days of 1x DVD burners, but I always feel like I burn less coasters when starting with an image.  Once the image is done, I archive it and the m4v file to my NAS and burn the disc from the image.  

That's it! Try it out before you burn multiple copies, but in general this works for me.