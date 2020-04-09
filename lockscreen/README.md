## A Lockscreen Module with PAM Integration

This is a lockscreen module with PAM integration. **The PAM integration was made possible by [RMTT](https://github.com/RMTT/)!**

![screenshot](lockscreen.png)

Instructions:

0. Clone the repo:

	```bash
	$ git clone --depth 1 https://github.com/manilarome/awesome-glorious-widgets ~/.config/awesome/
	```

1. Require it in your `rc.lua`.

	```lua
	require('awesome-glorious-widgets.lockscreen')
	```

2. Add keybinding:

	```lua
	    awful.key({ modkey }, "l", function() awful.spawn("awesome-client '_G.show_lockscreen()'", false) end,
              {description = "show the menubar", group = "launcher"})
    ```


More configuration:

Open the `awesome-glorious-widgets/lockscreen/init.lua`. Then, edit the theme variables and file directories if you want to. You can also change the profile picture.

If you found some bugs, please consider reporting it.