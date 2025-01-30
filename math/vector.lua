---@class Vector : Class
---
---@field x integer
---@field y integer
---
---@overload fun(x: integer?, y: integer?): Vector
local Vector = Class:extend()

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
