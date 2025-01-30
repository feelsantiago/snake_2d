local Object = require("objects.object")
local Vector = require("math.vector")

---@class Grid : Object
---
---@field objects Object[]
---
---@overload fun(position: Vector, width: integer, height: integer, objects: Object[]): Grid
local Grid = Object:extend()

function Grid:new(position, width, height, objects)
  self.super.new(self, position, width, height)
  self.objects = objects or {}
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
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle(
    "line",
    self.position.x,
    self.position.y,
    self.width,
    self.height
  )
end

function Grid:available()
  local finding = true
  local position =
      Vector.random(self.position.x, self.width, self.position.y, self.height)

  while finding do
    for _, object in ipairs(self.objects) do
      if not object:collide(position) then
        finding = false
      else
        finding = true
        break
      end
    end

    if finding then
      position = Vector.random(
        self.position.x,
        self.width,
        self.position.y,
        self.height
      )
    end
  end

  return position
end

return Grid
