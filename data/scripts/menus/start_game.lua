local game_manager = require("scripts/game_manager")

local start_game_menu = {}

function start_game_menu:on_started()
  local game = game_manager:create("save_game1.dat")
	
  game:start()
end


return start_game_menu