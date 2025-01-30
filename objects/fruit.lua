local Object = require("objects.object")
local Vector = require("math.vector")

---@class Fruit : Object
---
---@field size integer
---
---@overload fun(x: integer, y: integer, size: integer): Fruit
local Fruit = Object:extend()

function Fruit:new(x, y, size)
  self.super.new(self, Vector(x, y), size, size)
  self.size = size or 0
end

---@param position Vector
function Fruit:update(position)
  self.position = position
end

function Fruit:draw()
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle(
    "fill",
    self.position.x,
    self.position.y,
    self.width,
    self.height
  )
end

return Fruit
