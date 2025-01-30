local DIFFICULTY = require("config.difficulty")
local Vector = require("math.vector")
local Grid = require("objects.grid")
local Snake = require("objects.snake")
local Fruit = require("objects.fruit")

---@class Game : Class
---
---@field keyboard Keyboard
---@field grid Grid
---@field difficulty difficulty
---@field snake Snake
---@field fruit Fruit
---
---@overload fun(keyboard: Keyboard, difficulty: difficulty?): Game
local Game = Class:extend()

function Game:new(keyboard, difficulty)
  self.keyboard = keyboard
  self.difficulty = difficulty or DIFFICULTY.easy
  self.snake = Snake(15, 100, 50, self.difficulty)
  self.fruit = Fruit(350, 450, 50)
end

function Game:load()
  local width = love.graphics:getWidth() - 20
  local height = love.graphics:getHeight() - 60
  self.grid = Grid(Vector(10, 50), width, height, {
    self.snake,
    self.fruit,
  })
end

---@param dt integer
function Game:update(dt)
  local action = self.keyboard:action()
  local head = self.snake:head()

  -- verify head next position
  head:move(action, dt)

  if self.grid:inbound(head) then
    self.snake:move(action, dt)
  end

  if self.snake:collision(self.fruit) then
    local position = self.grid:available()
    self.fruit:update(position)
  end
end

function Game:draw()
  self.grid:draw()
  self.snake:draw()
  self.fruit:draw()
end

return Game
