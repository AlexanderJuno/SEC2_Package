-- coins_bag equipement


local item = ...
local game = item:get_game()



function item:on_created()
  item:set_savegame_variable("possession_coins_bag", variant)
  item:set_amount_savegame_variable("amount_coins")
  item:set_assignable(false)
end

function item:on_started()
  self:on_variant_changed(self:get_variant())
end

function item:on_obtaining(variant, savegame_variable)
  -- The coins bag is obtained empty
  game:get_item("equipment/coins_bag"):set_variant(variant)
end

-- Increase the capacity of coins depending on the variant of the coins bag
function item:on_variant_changed(variant)
  local coins_bag = game:get_item("equipment/coins_bag", variant)
  if variant == 0 then
		self:get_game():set_max_money(100)
  else
		-- Determine the max amount of coins
		local max_amounts =  {250, 500, 1000}
		local max_amount = max_amounts[variant]
    -- Set max amount
		self:get_game():set_max_money(max_amount)
  end
	--print("max money = ",game:get_max_money())
end