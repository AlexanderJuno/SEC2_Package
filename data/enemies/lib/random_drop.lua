
local random_drop = {}


-- yellow_slime random drop
function random_drop:yellow_drop(enemy)
	
  random = math.random(100)
  if random < 30 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/heart",
     }
	elseif random > 70 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(2),-- permet d'avoir le variant 1 ou 2 pour le money_drop
     }
	end
end

--blue_slime random drop
function random_drop:blue_drop(enemy)
	
  random = math.random(100)
  if random < 20 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/heart",
     }
	elseif random > 60 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(3),
     }
	end
end

-- green_slime random drop
function random_drop:green_drop(enemy)
	
  random = math.random(100)
  if random < 50 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/heart",
     }
	elseif random > 80 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(2),
     }
	end
end

-- red_slime random drop
function random_drop:red_drop(enemy)
	
  random = math.random(100)
  if random < 20 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/heart",
     }
	elseif random > 90 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(2),
     }
	end
end

-- violet_slime random drop
function random_drop:violet_drop(enemy)
	
  random = math.random(100)
  if random < 40 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/heart",
     }
	elseif random > 90 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(2),
     }
	end
end

-- plant random drop
function random_drop:plant_drop(enemy)
	
  random = math.random(100)
  if random < 60 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/apple",
     }
	elseif random > 90 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/few_treasure_coins",
		 treasure_variant = math.random(6),
     }
	end
end

-- Soldier random drop
function random_drop:soldier_drop(enemy)
	
  random = math.random(100)
  if random < 40 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/few_treasure_coins",
		 treasure_variant = math.random(6)
     }
	elseif random > 60 then
    local map = enemy:get_map()
    local x, y, layer = enemy:get_position()
    map:create_pickable{
     layer = layer,
     x = x,
     y = y,
     treasure_name = "consumables/coins",
		 treasure_variant = math.random(3),
     }
	end
end

return random_drop