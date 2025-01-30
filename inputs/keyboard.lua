local ACTIONS = require("inputs.actions")

---@enum keys
local KEYS = {
  up = "up",
  down = "down",
  left = "left",
  right = "right",
  none = "none",
}

---@class Keyboard : Class
---
---@field last actions
---
---@overload fun(action: actions?): Keyboard
local Keyboard = Class:extend()

function Keyboard:new(action)
  self.last = action or ACTIONS.move_right
end

---@return actions
function Keyboard:action()
  if love.keyboard.isDown(KEYS.up) then
    self.last = ACTIONS.move_up
    return ACTIONS.move_up
  elseif love.keyboard.isDown(KEYS.down) then
    self.last = ACTIONS.move_down
    return ACTIONS.move_down
  elseif love.keyboard.isDown(KEYS.left) then
    self.last = ACTIONS.move_left
    return ACTIONS.move_left
  elseif love.keyboard.isDown(KEYS.right) then
    self.last = ACTIONS.move_right
    return ACTIONS.move_right
  else
    return self.last
  end
end

return Keyboard
