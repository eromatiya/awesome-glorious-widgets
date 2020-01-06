# A Dynamic Wallpaper Widget

# Change wallpaper based on time.

# Instructions:  
+ Just `require` it to your `rc.lua`.  
	+ `require('dynamic-wallpaper-widget.dynamic-wallpaper')`  

# Default wallpaper directory is set on:  
`$HOME\.config\awesome\wallpapers\`  


# Note:  
+ The widget computes the time difference between the scheduled time when the wallpaper will change next and the current time.
+ The difference, in seconds, will be use as timeout in a `gears.timer`.
+ There's currently four scheduled time, which is midnight, day, noon, and night.
+ Note that suspending or making your laptop/pc to sleep will pause the timeout, delaying the wallpaper change after resuming the session.