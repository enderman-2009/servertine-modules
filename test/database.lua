local module = {}
local GUI = require("GUI")

local userTable

local workspace, window, loc, database, style = table.unpack({...})

module.name = "test"
module.table = {"testBox"}
module.debug = false
module.config = {}

module.init = function(usTable)
  userTable = usTable
end

module.onTouch = function()
  local thisInput = window:addChild(GUI.input(2,2,16,1,0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, "Hello world", "Placeholder text")) --set textbox
  thisInput.text = userTable.testBox
  thisInput.onInputFinished = function()
    userTable.testBox = thisInput.text
    database.update({"testBox"})
  end
  local thisInput = window:addChild(GUI.input(2,2,16,1,0xEEEEEE, 0x555555, 0x999999, 0xFFFFFF, 0x2D2D2D, "Hello world", "Placeholder text")) --set textbox
  thisInput.text = userTable.testBox
  thisInput.onInputFinished = function()
    userTable.testDrop = thisInput.text
    database.update({"testDrop"})
  end
end

module.close = function()
  return {"testmod","testmod2"}
end

return module
