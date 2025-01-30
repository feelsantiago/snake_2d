local Vector = require("math.vector")
local Object = require("objects.object")

---@class Grid : Object
---
---@overload fun(position: Vector, width: integer, height: integer): Grid
local Grid = Object:extend()

function Grid:new(position, width, height)
  self.super.new(self, position, width, height)
end

---@param object Object
function Grid:inbound(object)
  return object:rigth() < self:rigth()
      and object:left() > self:left()
      and object:bottom() < self:bottom()
      and object:top() > self:top()
end

---@param object Object
function Grid:outbound(object)
  return not self:inbound(object)
end

function Grid:draw()
  love.graphics.rectangle(
    "line",
    self.position.x,
    self.position.y,
    self.width,
    self.height
  )
end

return Grid
