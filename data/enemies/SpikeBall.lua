-- SpikeBall

local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local sprite
local movement


local chest_center = {x = map:get_entity("chest002"):get_center_position(x), y = map:get_entity("chest002"):get_center_position(y)-39} 

-- l'origine du coffre doit être pris en compte (13/2+ le rayon du cercle)!attention cette position devra être ajuster si le coffre est déplacé

function enemy:on_created()

  sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_damage(1)
	enemy:set_attack_consequence("sword", "protected")-- on ne veut pas que le hero puisse détruire l'ennemie

end


function enemy:on_restarted()

  movement = sol.movement.create("circle")
  movement:set_center(chest_center.x, chest_center.y) -- le centre du cercle est la position du coffre
  movement:set_radius(32) -- la longueur du rayon en pixel
  movement:set_angular_speed(2) -- la vitesse est en radian
  movement:set_ignore_obstacles(true)
  movement:start(self)
end

