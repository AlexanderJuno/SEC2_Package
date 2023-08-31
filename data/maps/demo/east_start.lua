-- Lua script of map demo/east_start.


local map = ...
local game = map:get_game()


-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
end

function sign_save:on_interaction()
	game:start_dialog('save_quit', function (answer)
		if answer == 1 then
			-- Continue.
			sol.audio.play_sound('ok')
		elseif answer == 2 then
			-- Save and continue
			sol.audio.play_sound('ok')
			game:save()
		else
			-- Quit without saving.
			sol.audio.play_sound('danger')
			sol.main.reset()
		end
	end)
end
 
-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end
