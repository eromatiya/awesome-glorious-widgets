# Notification Center Widget

# Store the notification in a panel


| Notification center |
| --- |
| ![Screenshot](https://github.com/ilovecookieee/awesome-glorious-widgets/blob/master/screenshots/notif-center.png) |

# Dependencies:
+ Awesome Window Manager (git master branch)

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
+ For `Do not disturb` button to work, add this to your `rc.lua`

```lua
naughty.connect_signal("request::display", function(n)
  -- Don't Show/Destroy popup notifications if notification panel is visible
  -- And if do not dont_disturb is on
  if _G.panel_visible or _G.dont_disturb then
    naughty.destroy_all_notifications()
  end

  -- You can add anything here
  -- You can add the system sound effects snippet here
end)
```

# Extras
You can also add a system sound effects when there is a new notification by installing `canberra-gtk-play`. After that, add the snippet below inside the `connect_signal` snippet above.

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
+ Putting the widget folder to a different path other than `$HOME/.config/awesome` may cause some issues. It is because there is some hard-coded paths in some of the files. Tinkering it by yourself is suggested. ;)
+ Change the colors of notification panel widget in `$HOME/.config/awesome/notif-center/init.lua`