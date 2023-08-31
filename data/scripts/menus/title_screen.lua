local menu = {}


local press_start = sol.sprite.create("menus/title_screen/press_start")



local function show_title_screen()

end

local function show_hero()


end

local function show_title()	

			press_start:set_animation("blinking")
end

function menu:on_started()
	sol.audio.play_music("game_over")
	sol.timer.start(3200, function() show_title() end)
end

function menu:on_draw(dst_surface)
		
		press_start:draw(dst_surface, 164, 234)
end

function menu:on_key_pressed(key)
		
		if key == "space" then
			sol.audio.play_sound("ok")
			sol.timer.start(500, function()
				press_start:set_animation("clear")
				press_start:set_direction(0)
				sol.timer.start(500, function() sol.menu.stop(menu) end)
			end)
			return trues
		end
end


return menu