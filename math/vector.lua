---@class Vector : Class
---
---@field x integer
---@field y integer
---
---@overload fun(x: integer?, y: integer?): Vector
local Vector = Class:extend()

---@param minX integer
---@param maxX integer
---@param minY integer
---@param maxY integer
function Vector.random(minX, maxX, minY, maxY)
  local x = love.math.random(minX, maxX)
  local y = love.math.random(minY, maxY)
  return Vector(x, y)
end

function Vector:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

---@param vector Vector
function Vector:add(vector)
  self.x = self.x + vector.x
  self.y = self.y + vector.y
end

return Vector
