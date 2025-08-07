local wezterm = require 'wezterm'
-- Define a lua table to hold _our_ module's functions
local module = {}

function module.move_pane(key, direction)
  return {
    key = key,
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

function module.resize_pane(key, direction)
  return {
    key = key,
    action = wezterm.action.AdjustPaneSize { direction, 3 }
  }
end

function module.navigate_to_tab(tab_index)
  return {
    key = tostring(tab_index),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(tab_index - 1),
  }
end

return module
