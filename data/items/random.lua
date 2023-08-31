-- Lua script of item "random".
-- This script is executed only once for the whole game.

-- Variables
local item = ...

-- When it is created, this item creates another item randomly chosen
-- and then destroys itself.

-- Probability of each item between 0 and 1000.
local probabilities = {
  [{ "consumables/coins", 1 }]              = 75,   -- 1 coin.
  [{ "consumables/coins", 2 }]              = 50,   -- 5 coins.
	[{ "consumables/coins", 3 }]			        = 5,		-- 10 coins.
  [{ "consumables/few_treasure_coins", 1 }] = 25,   -- 6 coins.
  [{ "consumables/few_treasure_coins", 2 }] = 20,   -- 7 coins.
  [{ "consumables/few_treasure_coins", 3 }] = 5,   -- 11 coins.
  [{ "consumables/few_treasure_coins", 4 }] = 5,   -- 12 coins.
  [{ "consumables/few_treasure_coins", 5 }] = 5,    -- 16 coins.
  [{ "consumables/heart", 1 }]              = 100,  -- Heart.
  --[{ "arrow", 1 }]              = 10,   -- 1 arrow.
	--[{ "bomb_refill", 1 }]              = 10,   -- 1 bomb.

}

-- Event called when a pickable treasure representing this item
-- is created on the map.
function item:on_pickable_created(pickable)

  local game = item:get_game()
  local treasure_name, treasure_variant = self:choose_random_item()
  if treasure_name ~= nil then
    local map = pickable:get_map()
    local x, y, layer = pickable:get_position()
    map:create_pickable{
      layer = layer,
      x = x,
      y = y,
      treasure_name = treasure_name,
      treasure_variant = treasure_variant,
    }
  end
  pickable:remove() -- se détruit pour pouvoir recommencer le calcul random
end

-- Returns an item name and variant.
function item:choose_random_item()

 
  local random = math.random(1000)
  local sum = 0
  -- où key est le nom qui est dans la table des probabilités
  for key, probability in pairs(probabilities) do 
    sum = sum + probability
    if random < sum then
      return key[1], key[2]
    end
  end

  return nil
  
end