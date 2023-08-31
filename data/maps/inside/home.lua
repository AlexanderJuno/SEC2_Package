-- Lua script of map demo/home.


local map = ...
local game = map:get_game()

-- noms des entités présentes dans la map:
-- chest001


-- Fonction appelée lors de l'initialisation de la map
function map:on_started()
	-- Ajouter le code d'initialisation
end


-- Fonction appelée dès que le joueur peut contrôler le héros
function map:on_opening_transition_finished()

end
