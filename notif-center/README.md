# Notification Center Widget

## A notification center widget for Awesome Window Manager  

| Screenshot|
| --- |
| ![Screenshot](https://github.com/ilovecookieee/awesome-glorious-widgets/blob/master/screenshots/notif-center.png) |

| Demo |
| --- |
| ![GIF](https://github.com/ilovecookieee/awesome-glorious-widgets/blob/master/screenshots/notif-center.gif) |


# Dependencies:
+ Awesome Window Manager (git master branch)
+ Libcanberra (optional)

# Instructions:  
+ Clone the repo.
+ Just copy the `notif-center` folder to `$HOME/.config/awesome/`. 
+ Then `require` it in your `wibox panel`.  
+ For example, let's put it in the top panel of a default `rc.lua`:

```lua
s.mywibox = awful.wibar({ position = "top", screen = s })
	
-- Add widgets to the wibox
s.mywibox.widget = {
	layout = wibox.layout.align.horizontal,
  { -- Left widgets
  	layout = wibox.layout.fixed.horizontal,
    mylauncher,
    s.mytaglist,
    s.mypromptbox,
  },
  s.mytasklist, -- Middle widget
  { -- Right widgets
  	layout = wibox.layout.fixed.horizontal,
  	mykeyboardlayout,
  	wibox.widget.systray(),
  	mytextclock,
  	s.mylayoutbox,
  	-- Let's put the notification center button after the layoutbox
  	require('notif-center')
  },
}
```
+ After that, it is recommended to add a `request::display` signal listener in your `rc.lua`:
+ Add the snippet below:

```lua
-- request::display signal listener
naughty.connect_signal('request::display', function(n)
    naughty.layout.box {notification = n}
end)
```

+ For `Do not disturb` button to work, add the snippet below to the `request::display` signal listener mentioned above:

```lua
-- We will use `destroy_all_notifications()` instead of `suspend()` because suspending naughty will also suspend the notification-center. It's a hackish way to hide the pop-ups, but hey, it's working.

-- Don't display notification pop-ups when the panel is visible and dont disturb mode is enabled.
if _G.panel_visible or _G.dont_disturb then
  naughty.destroy_all_notifications()
end
```

# Extras
You can also add a system sound effects when there is a new notification by installing `libcanberra`. Again, after that, add the snippet below inside inside the `request::display` signal.

```lua
-- Add sound effects if it's not do not disturb mode
if not _G.dont_disturb then
  -- Add Sound fx to notif
  -- Depends: canberra-gtk-play
  awful.spawn('canberra-gtk-play -i message', false)
end
```

# Note:  
+ If you have a problem, try to solve it or just open an issue.
+ Putting the widget folder to a different path other than `$HOME/.config/awesome` may cause some issues. It is because there is some hard-coded paths in some of the files. Tinkering it by yourself is recommended. ;)
+ Change the colors of notification panel widget in `$HOME/.config/awesome/notif-center/init.lua`
