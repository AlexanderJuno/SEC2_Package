-- Lua script of item consumables/coins.
-- This script is executed only once for the whole game.

local item = ...
local game = item:get_game()

function item:on_created()

	self:set_shadow("medium")
	self:set_can_disappear(true)
	self:set_brandish_when_picked(false)
	self:set_sound_when_picked("picked_coins")
end

function item:on_obtaining(variant, savegame_variable)

	local amounts = {42, 56, 65, 72, 81, 92}
	local amount = amounts[variant]
	if amount == nil then
		error("Invalid variant '" .. variant .. "' for item 'coins'")
	end
	-- game:get_item("equipment/coins_bag"):add_amount(amount)
	self:get_game():add_money(amount)
	--print("money amount = ",game:get_money())
end