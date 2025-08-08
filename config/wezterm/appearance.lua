local wezterm = require 'wezterm'
local utils = require 'utils'
-- Define a lua table to hold _our_ module's functions
local module = {}

local system_os = utils.get_os_name()
-- Returns a bool based on whether the host operating system's
-- appearance is light or dark.
function module.is_dark()
  -- wezterm.gui is not always available, depending on what
  -- environment wezterm is operating in. Just return true
  -- if it's not defined.
  if wezterm.gui then
    -- Some systems report appearance like "Dark High Contrast"
    -- so let's just look for the string "Dark" and if we find
    -- it assume appearance is dark.
    return wezterm.gui.get_appearance():find("Dark")
  end
  return true
end

function module.segments_for_right_status(window)
  if (system_os == 'windows') then
    return {
      window:active_workspace(),
      wezterm.strftime('%H:%M'),
      wezterm.hostname(),
    }
  end

  local battery_info = wezterm.battery_info()
  local battery_percent = ''
  for _, b in ipairs(battery_info) do
    battery_percent = '🦀' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  return {
    window:active_workspace(),
    wezterm.strftime('%H:%M'),
    battery_percent
  }
end

return module
