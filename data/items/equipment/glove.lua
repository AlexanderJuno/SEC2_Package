local item = ...
local game = item:get_game()

function item:on_created()
  item:set_savegame_variable("possession_glove")
  
end

function item:on_obtaining(savegame_variable)
  -- Set the new lifting ability
  self:get_game():set_ability("lift", 1)
end