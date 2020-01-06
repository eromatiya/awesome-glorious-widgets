local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')

local HOME = os.getenv('HOME')

local dpi = require('beautiful').xresources.apply_dpi

panel_visible = false

local right_panel = function(screen)
  local panel_width = dpi(350)
  local panel = wibox {
    ontop = true,
    screen = screen,
    width = panel_width,
    height = screen.geometry.height,
    x = screen.geometry.width - panel_width,
    bg = beautiful.panel_bg,
    fg = beautiful.fg_normal,
  }

  panel.opened = false

  local backdrop = wibox
  {
    ontop = true,
    screen = screen,
    bg = '#00000000',
    type = 'dock',
    x = screen.geometry.x,
    y = screen.geometry.y,
    width = screen.geometry.width,
    height = screen.geometry.height
  }

  panel:struts(
  {
    right = 0
  }
  )

openPanel = function()
  panel_visible = true
  backdrop.visible = true
  panel.visible = true
  panel:emit_signal('opened')
end

closePanel = function()
  panel_visible = false
  panel.visible = false
  backdrop.visible = false
  -- Change to notif mode on close
panel:emit_signal('closed')
end

-- Hide this panel when app dashboard is called.
function panel:HideDashboard()
  closePanel()
end

-- You can use this function in your keybindings
-- Just add this in your global keys:
-- _G.screen.primary.right_panel:toggle()
function panel:toggle()
  self.opened = not self.opened
  if self.opened then
    openPanel()
  else
    closePanel()
  end
end

backdrop:buttons(
  awful.util.table.join(
    awful.button(
      {},
      1,
      function()
        panel:toggle()
      end
    )
  )
)

panel:setup {
  expand = 'none',
  layout = wibox.layout.fixed.vertical,
  {
    require('notif-center.subwidgets.notification-center'),
    margins = dpi(15),
    widget = wibox.container.margin
  },
}

return panel
end

return right_panel


