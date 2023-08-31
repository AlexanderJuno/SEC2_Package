local initial_game = {}

-- Starting conditions for the game 
-- 
-- game - sol.game
-- 
-- Example
--  initialize_new_savegame(sol.game)
-- 
-- Returns nothing

function initial_game:initialize_new_savegame(game)
	sol.language.set_language("en")
  game:set_starting_location("demo/start","starting_destination")
  sol.main.load_settings("save_game.dat")

  game:set_max_life(6)
  game:set_life(game:get_max_life())
  game:set_max_money(100)
  

  game:set_ability("lift", 1)
  game:set_ability("swim",1)
  game:set_ability("sword",1)
	game:set_ability("jump_over_water",1)
	
  
	-- Set the commands in the game
  game:set_value("keyboard_save", "s")
	game:set_value("keyboard_pause", "d")
	game:set_value("keyboard_option", "f")
	game:set_value("keyboard_item_1", "x")
	game:set_value("keyboard_action", "space")
	game:set_value("keyboard_attack", "c")

end

return initial_game
