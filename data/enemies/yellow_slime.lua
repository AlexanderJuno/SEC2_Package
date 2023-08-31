-- yellow_slime enemy with detection hero and random movement

local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local sprite
local movement

local properties = {
	-- ajouter les propriété de l'ennemie selon:
	-- nom = valeur, ex:
	 life = 1,
	 damage = 1,
	-- normal_speed = 32,
}

-- Fonction appelée quand l'ennemie est créé
function enemy:on_created()

  sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_life(properties.life)
  enemy:set_damage(properties.damage)
end

-- Fonction appelée dans l'ennemie commence sa routine
function enemy:on_restarted()
	-- Ajouter votre code
end

-- AJOUTER LES FONCTIONS DU COMPORTEMENT DE L'ENNEMIE

function enemy:on_hurt()
	-- Ajouter votre code pour les blessures
end

function enemy:on_dead()
	-- Ajouter votre code de loot
end