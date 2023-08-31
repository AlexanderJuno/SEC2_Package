-- Lua script of item bottle.
-- This script is executed only once for the whole game.



return function(item)
  -- This script handles all bottles (each bottle script runs it).

  function item:on_using()

    local variant = self:get_variant()
    local game = self:get_game()
    local map = self:get_map()

    -- Empty bottle
    if variant == 1 then
      -- TODO : Prevent to spam the sound
      sol.audio.play_sound("wrong")
			game:start_dialog("no_more")
      self:set_finished()

    -- Red potion
    elseif variant == 2 then
			if game:get_life() ~= game:get_max_life() then
      		game:add_life(game:get_max_life())
				self:set_variant(1) -- make the bottle empty
				sol.timer.start(item, 500, function()
		   		 sol.audio.play_sound("heart")
					count = count + 1 
					return count < 2
		  		end)
			else
				sol.audio.play_sound("wrong")
				game:start_dialog("life_potion_not_needed")
			end
      
      self:set_finished()

    -- Yellow potion
    elseif variant == 3 then
      game:add_magic(game:get_max_magic())
			sol.timer.start(item, 500, function()
		    sol.audio.play_sound("water_drain_begin")
				count = count + 1 
				return count < 2
		  end)
      self:set_variant(1) -- make the bottle empty
      self:set_finished()

    -- Blue potion
    elseif variant == 4 then
      game:add_life(game:get_max_life())
			sol.timer.start(item, 500, function()
		    sol.audio.play_sound("heart")
				count = count + 1 
				return count < 2
		  end)
      self:set_variant(1) -- make the bottle empty
      game:add_magic(game:get_max_magic())
			sol.timer.start(item, 500, function()
		    sol.audio.play_sound("water_drain_begin")
				count = count + 1 
				return count < 2
		  end)
      self:set_finished()
    end

  end

end
