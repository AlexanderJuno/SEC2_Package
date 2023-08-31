-- Le compteur de pièces est affiché à l'écran

local coins_builder = {}

local coin_icon_img = sol.surface.create("hud/money_icon.png")

function coins_builder:new(game, config)

	local coins = {}

	local digits_text = sol.text_surface.create({
		font = "white_digits",
		horizontal_alignment = "left",
		vertical_alignment = "top",
	})
	local money_displayed = game:get_money()

	local dst_x, dst_y = config.x, config.y 

	function coins:on_draw(dst_surface)

		local x, y = dst_x, dst_y
		local width, height = dst_surface:get_size()
		if x < 0 then
			x = width + x
		end
		if y < 0 then
			y = height + y
		end
-- On détermine où dans l'écran les images s'affichent
		coin_icon_img:draw(dst_surface, x + 6, y)
		digits_text:draw(dst_surface, x + 20, y + 2)
	end

	-- Vérifier si le compteur affiche la bonne info
	-- et la mettre à jour s'il y a lieu
	local function check()
		
		local need_rebuild = false
		local money = game:get_money()
		local max_money = game:get_max_money()

		-- Le montant actuel.
		if money ~= money_displayed then

			need_rebuild = true
			if money_displayed < money then
				money_displayed = money_displayed + 1
			else
				money_displayed = money_displayed - 1
			end

			if money_displayed == money -- Le montant est correct.
				or money_displayed %3 == 0 then -- Sinon on joue le son "money_counter_end" à chaque valeur impaire.
					sol.audio.play_sound("money_counter_end")
			end
		end

		if digits_text:get_text() == "" then
			need_rebuild = true
		end

		-- mettre à jour le texte si quelque chose a changé
		if need_rebuild then
			digits_text:set_text(string.format("%04d", money_displayed))

			-- montrer si le maximum est atteint
			if money_displayed == max_money then
				digits_text:set_font("green_digits")
			else
				digits_text:set_font("white_digits")
			end
		end

		return true -- on répète le timer
	end

	-- vérifier périodiquement
	check()
	sol.timer.start(game, 10, check)

	return coins
end


return coins_builder
