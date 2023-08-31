-- Lua script of item consumables/3_hearts.
-- This script is executed only once for the whole game.

-- This script is executed only once for the whole game.

local item = ...
local game = item:get_game()

function item:on_created()
  self:set_shadow("small")
  self:set_can_disappear(true)
  self:set_brandish_when_picked(false)
  self:set_sound_when_picked("heart")
end

function item:on_obtaining(variant, savegame_variable)

	self:get_game():add_life(6)
end

