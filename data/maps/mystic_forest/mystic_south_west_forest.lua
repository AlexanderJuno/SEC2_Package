-- Lua script of map mystic_south_east_forest.


local map = ...
local game = map:get_game()
local switches = 0

-- noms des entités présentes dans la map:
-- chest021
-- switch001
-- switch002
-- switch003

-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
end


-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end
