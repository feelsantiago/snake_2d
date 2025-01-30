local Object = require("objects.object")
local Vector = require("math.vector")
local ACTIONS = require("inputs.actions")

---@class Snake : Object
---
---@field speed integer
---@field size integer
---@field body Object[]
---
---@overload fun(x: integer, y: integer, size: integer, speed: integer?): Snake
local Snake = Object:extend()

function Snake:new(x, y, size, speed)
  self.super.new(self, Vector(x, y), size, size)
  self.size = size
  self.speed = speed or 0
  self.body = {}
end

---@param action actions
---@param dt integer
function Snake:move(action, dt)
  local speed = self.size + self.speed
  if action == ACTIONS.move_up then
    local y = self.position.y - speed * dt
    self.position = Vector(self.position.x, y)
  elseif action == ACTIONS.move_down then
    local y = self.position.y + speed * dt
    self.position = Vector(self.position.x, y)
  elseif action == ACTIONS.move_left then
    local x = self.position.x - speed * dt
    self.position = Vector(x, self.position.y)
  elseif action == ACTIONS.move_right then
    local x = self.position.x + speed * dt
    self.position = Vector(x, self.position.y)
  end
end

function Snake:head()
  return Snake(self.position.x, self.position.y, self.size, self.speed)
end

---@param vector Vector
function Snake:reset(vector)
  self.position = vector
end

function Snake:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle(
    "fill",
    self.position.x,
    self.position.y,
    self.width,
    self.height
  )
end

return Snake
