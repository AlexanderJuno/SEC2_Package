require("scripts/multiple_events")
require("scripts/features") 
local game_manager = require("scripts/game_manager")


function sol.main:on_started()
  sol.language.set_language("en")

  local game = game_manager:create("game_save.dat")
end

-- Checks key presses for switching the fullscreen and terminating the game
--
-- key - is a string of the Name of a keyboard key
-- modifiers - is a table whose keys indicate what modifiers("shift", "control" and "alt") were down during the event.
--
-- Example
--  on_key_pressed(key => string, modifiers => table)
--  #=> boolian
--
-- Returns boolian
function sol.main:on_key_pressed(key, modifiers)
  local handled = false

  if (key == "return" and (modifiers.alt or modifiers.control)) then
    sol.video.set_fullscreen(not sol.video.is_fullscreen())
    handled = true
	end

  return handled
end
