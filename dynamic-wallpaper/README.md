# A Dynamic Wallpaper Widget

# Change wallpaper based on time.

# Instructions:  
Clone the repo to your configuration
```bash
git clone --depth=1 https://github.com/manilarome/awesome-glorious-widgets ~/.config/awesome/awesome-glorious-widgets
```

`require` it in your `rc.lua`.

`require('awesome-glorious-widgets.dynamic-wallpaper.dynamic-wallpaper')`  

# Default wallpaper directory is set on:  
`$HOME\.config\awesome\wallpapers\`  


# Note:  
+ The widget computes the time difference between the scheduled time when the wallpaper will change next and the current time.
+ The difference, in seconds, will be use as timeout in a `gears.timer`.
+ There's currently four scheduled time, which is midnight, day, noon, and night.