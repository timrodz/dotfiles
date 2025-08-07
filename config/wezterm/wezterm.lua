-- Pull in the wezterm API
local wezterm = require 'wezterm'
local appearance = require 'appearance'
local projects = require 'projects'
local navigation = require 'navigation'
local utils = require 'utils'

-- This will hold the configuration.
local config = wezterm.config_builder()

local system_os = utils.get_os_name()

-- VISUALS

-- Font
config.font_size = 13
config.font = wezterm.font 'JetBrainsMono Nerd Font'

-- OS-specific settings
if (system_os == 'windows') then
  config.wsl_domains = {
    {
      name = 'WSL:Ubuntu',
      distribution = 'Ubuntu',
    },
  }
  config.default_domain = 'WSL:Ubuntu'
  config.window_background_opacity = 0.9
  config.win32_system_backdrop = 'Acrylic'
elseif system_os == 'linux' then
  config.window_background_opacity = 0.2
  config.kde_window_background_blur = true
else
  config.font_size = 15
  config.set_environment_variables = {
    PATH = '/opt/homebrew/bin:' .. os.getenv('PATH')
  }
  config.window_background_opacity = 0.9
  config.macos_window_background_blur = 30
end

-- VISUALS
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.tab_max_width = 32
config.initial_cols = 120
config.initial_rows = 28
config.switch_to_last_active_tab_when_closing_tab = true

config.pane_focus_follows_mouse = true
config.scrollback_lines = 5000

-- Theme
if appearance.is_dark() then
  config.color_scheme = 'Catppuccin Mocha'
else
  config.color_scheme = 'Catppuccin Latte'
end

config.colors = {
  tab_bar = {
    active_tab = {
      fg_color = '#000000',
      bg_color = '#D85FAA'
    }
  }
}

-- Removes the title bar, leaving only the tab bar
config.window_decorations = 'RESIZE'

config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 11,
}

-- Top-right status bar
wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
  local segments = appearance.segments_for_right_status(window)

  local color_scheme = window:effective_config().resolved_palette
  -- Note the use of wezterm.color.parse here, this returns
  -- a Color object, which comes with functionality for lightening
  -- or darkening the colour (amongst other things).
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  -- Each powerline segment is going to be coloured progressively
  -- darker/lighter depending on whether we're on a dark/light colour
  -- scheme. Let's establish the 'from' and 'to' bounds of our gradient.
  local gradient_to, gradient_from = bg, nil
  if appearance.is_dark() then
    gradient_from = gradient_to:lighten(0.2)
  else
    gradient_from = gradient_to:darken(0.2)
  end

  -- Yes, WezTerm supports creating gradients, because why not?! Although
  -- they'd usually be used for setting high fidelity gradients on your terminal's
  -- background, we'll use them here to give us a sample of the powerline segment
  -- colours we need.
  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #segments -- only gives us as many colours as we have segments.
  )

  -- We'll build up the elements to send to wezterm.format in this table.
  local elements = {}

  for i, seg in ipairs(segments) do
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })
    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

-- HOTKEYS

-- Leader: CTRL + SPACE
config.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  -- Sends ESC + b and ESC + f sequence, which is used
  -- for telling your shell to jump back/forward.
  {
    -- When the left arrow is pressed
    key = 'LeftArrow',
    -- With the 'Option' key modifier held down
    mods = 'OPT',
    -- Perform this action, in this case - sending ESC + B
    -- to the terminal
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  {
    key = '=',
    mods = 'LEADER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'vim', wezterm.config_file },
    },
  },
  -- Create new tab
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Navigate between tabs
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Split pane
  {
    key = '/',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Close pane
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = '[',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode
  },
  -- Navigate between tabs
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.ShowTabNavigator,
  },
  -- Show projects
  {
    key = 'p',
    mods = 'LEADER',
    -- Present in to our project picker
    action = projects.choose_project(),
  },
  -- Show workspaces
  {
    key = 'f',
    mods = 'LEADER',
    -- Present a list of existing workspaces
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  -- Toggle zoom
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.TogglePaneZoomState,
  },
  -- Navigation between panes
  navigation.move_pane('j', 'Down'),
  navigation.move_pane('k', 'Up'),
  navigation.move_pane('h', 'Left'),
  navigation.move_pane('l', 'Right'),
  navigation.navigate_to_tab(1),
  navigation.navigate_to_tab(2),
  navigation.navigate_to_tab(3),
  navigation.navigate_to_tab(4),
  navigation.navigate_to_tab(5),
  navigation.navigate_to_tab(6),
  navigation.navigate_to_tab(7),
  navigation.navigate_to_tab(8),
  -- Activate the resizing panel
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ActivateKeyTable {
      name = 'resize_panes',
      -- Ensures the keytable stays active after it handles its
      -- first keypress.
      one_shot = false,
      -- Deactivate the keytable after a timeout.
      timeout_milliseconds = 1000,
    }
  },
  -- Rename tab
  {
    key = ',',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end
      ),
    },
  },
  -- Rename workspace
  {
    key = '.',
    mods = 'LEADER',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for session',
      action = wezterm.action_callback(
        function(window, pane, line)
          if line then
            wezterm.mux.rename_workspace(
              window:mux_window():get_workspace(),
              line
            )
          end
        end
      ),
    },
  },
}

config.key_tables = {
  resize_panes = {
    navigation.resize_pane('j', 'Down'),
    navigation.resize_pane('k', 'Up'),
    navigation.resize_pane('h', 'Left'),
    navigation.resize_pane('l', 'Right'),
  },
}

-- Finally, return the configuration to wezterm:
return config
