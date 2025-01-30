local Vector = require("math.vector")

---@class Score : Class
---
---@field position Vector
---@field current integer
---@field base integer
---@field private font love.Font
---
---@overload fun(x: integer, y:integer, base: integer?): Score
local Score = Class:extend()

function Score:new(x, y, base)
  self.current = 0
  self.base = base or 10
  self.position = Vector(x, y)
  self.font = love.graphics.newFont(18)
end

function Score:increment()
  self.current = self.current + self.base
end

function Score:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.setFont(self.font)
  love.graphics.print(
    "Score: " .. self.current,
    self.position.x,
    self.position.y
  )
end

return Score
