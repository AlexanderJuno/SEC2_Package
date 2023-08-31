-- Lua script of item arrow
-- This script is executed only once for the whole game.

local item = ...
local game = item:get_game()

function item:on_created()
	self:set_shadow("small")
	self:set_can_disappear(true)
	self:set_brandish_when_picked(false)
	self:set_sound_when_picked("picked_item")
end

function item:on_started()
		-- If the player doesn't have the bow and quiver, he can't get arrows
	item:set_obtainable(game:has_item("equipment/quiver"))
end

function item:on_obtaining(variant, savegame_variable)

	local amounts = {1, 5, 10}
	local amount = amounts[variant]
	if amount == nil then
		error("Invalid variant '" .. variant .. "' for item 'arrows'")
	else
		game:get_item("equipment/quiver"):add_amount(amount)
	end
end

