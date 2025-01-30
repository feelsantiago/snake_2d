-- load global class
Class = require("libraries.classic")

local Game = require("game.game")
local Keyboard = require("inputs.keyboard")
local ACTIONS = require("inputs.actions")
local DIFFICULTY = require("config.difficulty")

---@type Game
local game = nil

function love.load()
	local keyboard = Keyboard(ACTIONS.move_right)
	game = Game(keyboard, DIFFICULTY.normal)

	game:load()

	love.graphics.setBackgroundColor(0, 0, 0)
end

---@param dt integer
function love.update(dt)
	game:update(dt)
end

function love.draw()
	game:draw()
end
