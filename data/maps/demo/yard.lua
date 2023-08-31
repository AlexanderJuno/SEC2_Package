-- yard.lua

local map = ...
local game = map:get_game()

-- noms des entités présentes dans la map:
-- red_scarecrow
-- sign_save


-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
end

function red_scarecrow:on_interaction()
  game:start_dialog("npc.welcome")
end


function sign_save:on_interaction()
	game:start_dialog("save_quit", function (answer)
		if answer == 1 then
			-- Continue.
			sol.audio.play_sound("ok")
		elseif answer == 2 then
			-- Save and continue
			sol.audio.play_sound("ok")
			game:save()
		elseif answer == 3 then
			-- Save and quit
			sol.audio.play_sound("ok")
			game:save()
			sol.main.reset()
		else
			-- Quit without saving.
			sol.audio.play_sound("danger")
			sol.main.reset()
		end
	end)
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

-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end
