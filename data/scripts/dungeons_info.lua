-- Define the existing dungeons and their floors for the minimap menu.
local dungeons_info = {

  ["dungeon_of_slimy_slime"] = {
   -- nom des petites clés : "dungeon_of_slimy_slime_small_keys"

    lowest_floor = -2,
    highest_floor = -1,
    maps = {
-- entrez l'ID des maps qui font partie du donjon 1
--    "dungeon/entrance",
--    "dungeon/main_chamber",
--    "dungeon/west_chamber",
--    "dungeon/west_entrance",


    },
  },

	["dungeon_of_sugar_rush"] = {
  -- nom des petites clés : "dungeon_of_sugar_rush_small_keys"
    lowest_floor = -1,
    highest_floor = 0,
    maps = {
-- entrez l'ID des maps qui font partie du donjon 2 
     -- "dungeons/dungeon_02",
			
    },
  },

  ["mystic_forest"] = {
  -- nom des petites clés : "mystic_forest_small_keys"
   lowest_floor = 0,
   highest_floor = 0,
    maps = {

    },
  },


  ["raging_forest"] = {
  -- nom des petites clés : "raging_forest_small_keys"
    lowest_floor = 0,
    highest_floor = 0,
    maps = {

   --"raging_forest/...",

    },
  },

  ["demo"] = {
  -- nom des petites clés : "demo_small_keys"
  lowest_floor = 0,
  highest_floor = 0,
  maps = {
    "demo/start",
    "demo/east_start",
    "demo/yard",
    "demo/east_yard",
    "demo/forest",
    "demo/east_forest",
    
    },
  },

}

return dungeons_info