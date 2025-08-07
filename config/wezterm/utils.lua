local wezterm = require 'wezterm'
-- Define a lua table to hold _our_ module's functions
local module = {}

function module.get_os_name()
    if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
        return 'windows'
    elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
        return 'linux'
    else
        return 'osx'
    end
end

return module
