local item = ...
local game = item:get_game()

function item:on_created()
  item:set_savegame_variable("possession_ring")
 
end

function item:on_obtaining(variant, savegame_variable)
  -- Set the new lifting ability
  self:get_game():set_ability("lift", 2)
end