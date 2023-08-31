-- Script that creates a game ready to be played.

-- Usage:
-- local game_manager = require("scripts/game_manager")
-- local game = game_manager:create("savegame_file_name")
-- game:start()

local initial_game = require("scripts/initial_game")



local game_manager = {}



-- Creates a game ready to be played.
function game_manager:create(file_name)

  local exists = sol.game.exists(file_name)
  local game = sol.game.load(file_name)
	sol.main.load_settings("save_game1.dat")
  if not exists then
    -- Initialize a new savegame.
    initial_game:initialize_new_savegame(game)
  end
  game:start()



	-- A quick save game menu:
	game:register_event("on_key_pressed", function(game, key)

    if game.customizing_command then
      -- Don't treat this input normally, it will be recorded as a new command binding
      -- by the commands menu.
      return false
    end
		
		if game:is_pause_allowed() then
			if key == "s" then
					sol.audio.play_sound("pause_open")
					game:start_dialog("save_quit", function (answer)
						if answer == 1 then
							-- Continue.
							sol.audio.play_sound("ok")
						elseif answer == 2 then
							-- Save and continue.
							sol.audio.play_sound("ok")
							game:save()
						elseif answer == 3 then
							-- Save and quit.
							sol.audio.play_sound("ok")
							game:save()
							sol.main.reset()
						else
							-- Quit without saving.
							sol.audio.play_sound("pause_closed")
							sol.main.reset()
						end
					end)
			end	
		end
		
  end)


end



return game_manager

