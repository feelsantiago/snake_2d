---@class Object : Class
---@field position Vector
---@field width integer
---@field height integer
---@overload fun(position: Vector, width: integer, height: integer): Object
local Object = Class:extend()

function Object:new(vector, width, height)
  self.position = vector
  self.width = width or 0
  self.height = height or 0
end

function Object:left()
  return self.position.x
end

function Object:rigth()
  return self.position.x + self.width
end

function Object:top()
  return self.position.y
end

function Object:bottom()
  return self.position.y + self.height
end

---@param other Object
function Object:collision(other)
  return self:rigth() > other:left()
      and self:left() < other:rigth()
      and self:bottom() > other:top()
      and self:top() < other:bottom()
end

---@param point Vector
function Object:collide(point)
  return self:rigth() >= point.x
      and self:left() <= point.x
      and self:bottom() >= point.y
      and self.top <= point.y
end

return Object
