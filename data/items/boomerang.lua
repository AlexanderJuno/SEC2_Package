local item = ...

-- Event called when the game is initialized.
function item:on_created()

  self:set_savegame_variable("possession_boomerang",variant)
  self:set_assignable(true)
	self:set_brandish_when_picked(false)
end


function item:on_using()
  item:start_using()
  item:set_finished()
end

--TODO Remake me using a custom entity !!!!!
function item:start_using()

  local hero = self:get_map():get_entity("hero")
  if self:get_variant() == 1 then
    hero:start_boomerang(128, 160, "boomerang1", "entities/boomerang1")
  else
    hero:start_boomerang(192, 320, "boomerang2", "entities/boomerang2")
  end
  self:set_finished()

end