-- Lua script of item consumables/heart_container.
-- This script is executed only once for the whole game.

local item = ...

-- Produit un son lorsque brandi
function item:on_created()

--	self:set_sound_when_brandished("treasure")
	 self:set_brandish_when_picked(false)
end

-- Augmente la santé max du joueur lorsque obtenu
function item:on_obtained(variant, savegame_variable)

	local game = self:get_game()
	game:add_max_life(2)
	game:set_life(game:get_max_life())
end