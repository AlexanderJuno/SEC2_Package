-- This item represent the equipable bow in the inventory
-- <!> Obtaining the Bow automatically gives a basic quiver

local item = ...
local game = item:get_game()


function item:on_created()
  item:set_savegame_variable("possession_bow",variant)
  item:set_assignable(true)
end

function item:on_obtaining(variant, savegame_variable)

  -- Obtaining the Bow automatically gives a quiver
  local quiver = game:get_item("equipment/quiver")
  if not quiver:has_variant() then
    -- We don't fill the quiver because on_obtaining is not called
    local bow_variant = game:get_item("bow"):get_variant()
    if bow_variant == 1 then
    --The quiver is not filled if the bow is empty
      quiver:set_variant(1)
			quiver:add_amount(0)
		else
    -- The bow has some arrows, we fill at half the quiver
      quiver:set_variant(1)
      quiver:add_amount(quiver:get_max_amount()/3)
    end
  end
--Debuging interface info:
	--print("arrows in the quiver", game:get_item("quiver"):get_amount())
	--print("bow variant is :",game:get_item("bow"):get_variant())
end

-- Called when the player uses the bow of his inventory
function item:on_using()
  local quiver = game:get_item("equipment/quiver")
	-- If the quiver is empty, the player can't shoot arrows
	if quiver:get_amount() == 0 then
		sol.audio.play_sound("wrong")
		game:start_dialog("no_more")
		item:set_finished()
		return
	end
  		
	local map = game:get_map()
	local hero = game:get_hero()
	quiver:remove_amount(1)
	hero:start_bow()
	--Debuging interface infos:
	--print("hero shooting arrows")
	--print("arrows in the quiver", game:get_item("quiver"):get_amount())
 	
 
  
	item:set_finished()
end