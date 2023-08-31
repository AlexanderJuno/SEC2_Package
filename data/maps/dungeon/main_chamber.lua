-- Lua script of map main_chamber

local map = ...
local game = map:get_game()

-- noms des entités présentes dans la map:
-- chest030
-- switch001
-- giant_slime
-- wall001
-- wall002


-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
	giant_slime:set_enabled(false)
	wall001:set_enabled(false)
	wall002:set_enabled(false)
end


-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end

