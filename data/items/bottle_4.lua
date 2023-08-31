-- Lua script of item bottle_4.
-- This script is executed only once for the whole game.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local item = ...
local game = item:get_game()

function item:on_created()
  self:set_assignable(true)
  self:set_savegame_variable("possession_bottle_4")
end

local bottle_script = require("items/bottle.lua")
bottle_script(item)
