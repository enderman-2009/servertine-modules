local module = {}
local GUI = require("GUI")

local userTable

local workspace, window, loc, database, style = table.unpack({...})

module.name = "test"
module.table = {"test"}
module.debug = false
module.config = {}

module.init = function(usTable)
  userTable = usTable
end

module.onTouch = function()
  local thisInput = window:addChild(GUI.Input(2,2,16,1,0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, "Hello world", "Placeholder text"))
  thisInput.text = userTable.test
  If you add thisInput.onInputFinished = function()
    userTable.test = thisInput.text
    database.update("test")
  end
end

module.close = function()
  return {"testmod","testmod2"}
end

return module
