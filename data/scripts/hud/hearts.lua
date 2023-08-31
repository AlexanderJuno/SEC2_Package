-- Les coeurs sont affichés à l'écran

local hearts_builder = {}

local hearts_img = sol.surface.create("hud/hearts2.png")

function hearts_builder:new(game, config)

	local hearts = {}

	hearts.surface = sol.surface.create(128, 30)
	hearts.dst_x = config.x 
	hearts.dst_y = config.y 
	hearts.max_life_displayed = game:get_max_life()
	hearts.current_life_displayed = game:get_life()

	-- On crée une fonction pour l'alerte de LOW HEALTH
	function hearts:repeat_danger_sound()

		if game:get_life() <= game:get_max_life() / 4 then

			sol.audio.play_sound("danger")
			hearts.danger_sound_timer = sol.timer.start(hearts, 750, function()
				hearts:repeat_danger_sound()
			end)
			hearts.danger_sound_timer:set_suspended_with_map(true)
		else
			hearts.danger_sound_timer = nil
		end
	end

	-- On détermine l'endroit utilisé pour afficher les coeurs
	function hearts:rebuild_surface()

		hearts.surface:clear()

		local life =  hearts.current_life_displayed
		local max_life = hearts.max_life_displayed
		for j = 1, max_life do
			-- on affiche les coeurs sur 1 ou 2 lignes
			if j % 2 == 0 then
				local x, y 
				if j <= 16 then
					x = 8 * (j - 2)
					y = 0
				else
					x = 8*(j - 18)
					y = 16
				end
				if life >= j then
					hearts_img:draw_region(0, 0, 16,16, hearts.surface, x, y)
				else
					hearts_img:draw_region(64, 0, 16, 16, hearts.surface, x, y)
				end
			end
		end
		if life % 2 == 1 then
			local x, y
			if life <= 16 then
				x = 8 * (life - 1)
				y = 0
			else
				x = 8 * (life - 25)
				y = 16
			end
			hearts_img:draw_region(16, 0, 16, 16, hearts.surface, x, y)
		end
	end

	-- On affiche les coeurs sur le surface
	function hearts:on_draw(dst_surface)

		local x, y = hearts.dst_x, hearts.dst_y
		local width, height =  dst_surface:get_size()
		if x < 0 then
			x = width + x
		end
		if y < 0 then
			y = height + y
		end
-- On détermine où les coeurs s'affichent dans l'écran
		hearts.surface:draw(dst_surface, x, y + 4)
	end

	-- Vérifier que les informations affichées sont correctes
	-- et les mettre à jour si nécessaire
	function check()

		local need_rebuild = false

		-- Santé maximale
		local max_life = game:get_max_life()
		if max_life ~= hearts.current_life_displayed then
			need_rebuild =  true
			hearts.max_life_displayed =  max_life
		end

		-- Santé actuelle
		local current_life = game:get_life()
		if current_life == hearts.current_life_displayed then
			hearts.sound_remainder = nil
		else

			need_rebuild = true
			if current_life < hearts.current_life_displayed then
				hearts.current_life_displayed = hearts.current_life_displayed - 1
			else
				hearts.current_life_displayed = hearts.current_life_displayed + 1
				if game:is_started() then
					if hearts.sound_remainder == nil then
						hearts.sound_remainder =  hearts.current_life_displayed % 4
					end
					if hearts.current_life_displayed % 4 == hearts.sound_remainder then
						sol.audio.play_sound("heart")
					end
				end
			end
		end

		-- Pendant le jeu, jouer une animation et un son quand la santé est basse
		if game:is_started() then

			if game:get_life() <= game:get_max_life() / 4
				and not game:is_suspended() then
			need_rebuild =  true
				if hearts.danger_sound_timer ==  nil then
					hearts.danger_sound_timer =  sol.timer.start(hearts, 250, function()
						hearts:repeat_danger_sound()
					end)
				hearts.danger_sound_timer:set_suspended_with_map(true)
				end
			end
		end

		-- Mettre à jour la surface seulement si quelque chose a changé.
		if need_rebuild then
			hearts:rebuild_surface()
		end

		return true -- répéter le timer
	end

	-- On crée une fonction pour que les coeurs soient affichés
	-- pendant le jeu seulement
	function hearts:on_started()
		hearts.danger_sound_timer = nil
		check()
		sol.timer.start(hearts, 50, check)
		hearts:rebuild_surface()
	end

	return hearts
end

return hearts_builder
















