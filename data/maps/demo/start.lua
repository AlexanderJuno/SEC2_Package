-- start.lua
local map = ...
local game = map:get_game()
local options_menu = require("scripts/menus/options")



-- noms des entités présentes dans la map:
-- sign_delete
-- inventory_sign
-- option_sign


-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
end

function sign_delete:on_interaction()
	
		game:start_dialog("delete_save", function (answer)
			if answer == 1 then
				-- Continue.
				sol.audio.play_sound("ok")
			elseif answer == 2 then
				game:start_dialog("demo.confirmation",function (a)
					if a == 2 then
						-- Continue
						sol.audio.play_sound("ok")
					elseif a == 3 then
						-- delete savefile
						sol.audio.play_sound("danger")
						sol.game.delete("game_save.dat")
						sol.main.reset()
					end
				end)
			end
		end)

end

function option_sign:on_interaction()
  sol.menu.start(game, options_menu)
  function options_menu:on_finished()
		sol.menu.stop(options_menu)
	end
end




-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end
