local item = ...
local game = item:get_game()

function item:on_created()
  item:set_savegame_variable("possession_tunic")
end

function item:on_variant_changed(variant)
	game:set_ability("tunic", variant)
end

function item:on_obtaining(variant)

  local game = item:get_game()
  -- Audio
  sol.audio.play_sound("heart_container")
  -- Give the built-in ability "tunic", but only after the treasure sequence is done.
  game:set_ability("tunic", variant)


  
end