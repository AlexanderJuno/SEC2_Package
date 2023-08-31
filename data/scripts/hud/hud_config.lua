-- Defines the elements to put in the HUD
-- and their position on the game screen.

-- You can edit this file to add, remove or move some elements of the HUD.

-- Each HUD element script must provide a method new()
-- that creates the element as a menu.
-- See for example scripts/hud/hearts.lua.

-- Negative x or y coordinates mean to measure from the right or bottom
-- of the screen, respectively.

local hud_config = {


  -- Item assigned to slot 1. item X.
  {
    menu_script = "scripts/hud/item_1",
    x = 32,
    y = 4,
    slot = 1,  -- Item slot (1 or 2).
  },

	-- Item assigned to slot 2. item Y.
  {
    menu_script = "scripts/hud/item_2",
    x = 4,
    y = 20,
    slot = 2,  -- Item slot (1 or 2).
  },


  -- coins counter.
  {
    menu_script = "scripts/hud/coins",
    x = 8,
    y = 220,
  },

 -- Bombs counter
  {
    menu_script = "scripts/hud/bombs",
   x = 144,
    y = 12,
  },

 -- Arrow counter
 {
    menu_script = "scripts/hud/arrows",
    x = 111,
    y = 12,
  },

-- Life Potion counter
-- {
--		menu_script = "scripts/hud/life_potion",
--		x = 81,
--		y = 12,
--	},

  -- Small key counter.
  {
    menu_script = "scripts/hud/small_keys",
    x = 59,
    y = 218,
  },

  -- Hearts meter.
  {
    menu_script = "scripts/hud/hearts",
    x = -136,
    y = 0,
  },

  -- You can add more HUD elements here.
}

return hud_config
