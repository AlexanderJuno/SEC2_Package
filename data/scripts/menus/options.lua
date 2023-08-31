local options_menu = {}

local gui_designer = require("scripts/menus/gui_designer")
local layout
local cursor_img = sol.surface.create("menus/arrow_cursor.png")
local slider_img = sol.surface.create("menus/slider.png")
local music_slider_x
local sound_slider_x
local slider_cursor_img = sol.surface.create("menus/slider_cursor.png")
local languages = sol.language.get_languages()
local language_index

-- Cursor position:
-- 1: music volume
-- 2: sound volume
-- 3: language
-- 4: back
local cursor_position

local function build_layout()

  layout = gui_designer:create(320, 240)

  layout:make_wood_tiled_background(16, 32, 280, 180)
  
	layout:make_wooden_frame(12, 32, 296, 196)
	layout:make_big_wooden_frame(32, 36, 72, 32)

	layout:make_text(sol.language.get_string("options_menu.title"), 66, 44, "center")
  layout:make_text(sol.language.get_string("options_menu.music_volume"), 72, 80)
  layout:make_image(slider_img, 128, 80)
  layout:make_text(sol.language.get_string("options_menu.sound_volume"), 72, 110)
  layout:make_image(slider_img, 128, 110)
  layout:make_text(sol.language.get_string("options_menu.language"), 72, 142)
  layout:make_text("< " .. sol.language.get_language_name() .. " >", 240, 142, "right")
	layout:make_wooden_frame(32, 184, 56, 24)
  layout:make_text(sol.language.get_string("options_menu.back"), 56, 188)
end

-- Places the cursor on option 1, 2 or 3,
-- or on the back button (4).
local function set_cursor_position(index)
  cursor_position = index
  if index == 4 then
    cursor_img:set_xy(32, 188)
  else
    cursor_img:set_xy(32, 46 + index * 32)
  end
end

local function update_music_slider()

  local volume = sol.audio.get_music_volume()
  music_slider_x = 136 + (volume * 128 / 100)
end

local function update_sound_slider()

  local volume = sol.audio.get_sound_volume()
  sound_slider_x = 136 + (volume * 128 / 100)
end

local function increase_music_volume()

  local game = sol.main.get_game()
  local volume = sol.audio.get_music_volume()
  if volume < 100 then
    volume = volume + 10
    sol.audio.set_music_volume(volume)
    update_music_slider()

  end
end

local function decrease_music_volume()

  local game = sol.main.get_game()
  local volume = sol.audio.get_music_volume()
  if volume > 0 then
    volume = volume - 10
    sol.audio.set_music_volume(volume)
    update_music_slider()
		
  end
end

local function increase_sound_volume()

  local game = sol.main.get_game()
  local volume = sol.audio.get_sound_volume()
  if volume < 100 then
    volume = volume + 10
    sol.audio.set_sound_volume(volume)
    update_sound_slider()
		
  end
end

local function decrease_sound_volume()

  local game = sol.main.get_game()
  local volume = sol.audio.get_sound_volume()
  if volume > 0 then
    volume = volume - 10
    sol.audio.set_sound_volume(volume)
    update_sound_slider()
		game:set_value("sound_volume", volume)  -- on veut que les settings soient sauvegardés
  end
end

local function previous_language()

  language_index = ((language_index - 2) % #languages) + 1
  sol.language.set_language(languages[language_index])
  build_layout()
end

local function next_language()

  language_index = (language_index % #languages) + 1
  sol.language.set_language(languages[language_index])
  build_layout()
end

function options_menu:on_started()
	sol.main.load_settings("save_game1.dat")
  build_layout()
  set_cursor_position(4)  -- Back.
  update_music_slider()
  update_sound_slider()

  for i, language in ipairs(languages) do
    if language == sol.language.get_language() then
      language_index = i
    end
  end
end

function options_menu:on_draw(dst_surface)

  layout:draw(dst_surface)
  cursor_img:draw(dst_surface)
  slider_cursor_img:draw(dst_surface, music_slider_x, 80)
  slider_cursor_img:draw(dst_surface, sound_slider_x, 110)
end

function options_menu:on_key_pressed(key)

  if key == "down" then
    sol.audio.play_sound("cursor")
    if cursor_position < 4 then
      set_cursor_position(cursor_position + 1)
    else
      set_cursor_position(1)
    end
  elseif key == "up" then
    sol.audio.play_sound("cursor")
    if cursor_position > 1 then
      set_cursor_position(cursor_position - 1)
    else
      set_cursor_position(4)
    end
  elseif key == "left" then
    sol.audio.play_sound("heart")
    if cursor_position == 1 then
      decrease_music_volume()
    elseif cursor_position == 2 then
      decrease_sound_volume()
    elseif cursor_position == 3 then
      previous_language()
    end
  elseif key == "right" then
    sol.audio.play_sound("heart")
    if cursor_position == 1 then
      increase_music_volume()
    elseif cursor_position == 2 then
      increase_sound_volume()
    elseif cursor_position == 3 then
      next_language()
    end
  elseif key == "space" then
    if cursor_position == 4 then
      sol.audio.play_sound("message_letter")
			sol.main.save_settings("save_game1.dat")
      sol.menu.stop(options_menu)
    end
  end

  -- Don't forward the key event to the savegame menu below.
  return true
end


gui_designer:map_joypad_to_keyboard(options_menu)

return options_menu
