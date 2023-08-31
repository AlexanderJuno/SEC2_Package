-- example of script to add on the dungeon map to show the name of
-- the dungeon the player juste entered


local menu = {}
local parchment = sol.sprite.create("menus/inventory/parchment")
local lvl = {1, 2, 3, 4, 5, 6, 7, 8, 9} -- choose the right number in the next call:
local dungeon_name = sol.language.get_string("dungeon" .. lvl)

local dungeon_title = sol.text_surface.create({
		horizontal_alignment = "center",
		vertical_alignment = "top",
		font = "default_font", 
})

-- in the function "map:on_transition_finished()" call "sol.menu.start(map, menu)"

local function menu:on_started()
		parchment:draw(dst_surface, 160, 160)
		parchment:set_animation("opening")
		parchment:set_direction(0)
		sol.timer.start(360, function() dungeon_title:set_text(dungeon_name) end)
		sol.timer.start(2500, function()
			parchment:set_animation("closing")
			parchment:set_direction(0)
			sol.timer.start(90, function() dungeon_title:set_text(nil) end)
			sol.timer.start(500, function() sol.menu.stop(menu) end)
		end)
end


function menu:on_draw(dst_surface)
		parchment:draw(dst_surface, 160, 160)
		dungeon_title:draw(dst_surface, 160, 160)
end

return menu