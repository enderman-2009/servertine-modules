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
  local i2 = 4
  for i, v in pairs(usertable.testBox)
    local i2 = i2-2
    local box = window:addChild(GUI.input(2,i2,16,1,style.passInputBack,style.passInputText,style.passInputPlaceholder,style.passInputFocusBack,style.passInputFocusText,"text1","textBox1")) --sets textbox
    box.text = v
    box.onInputFinished = function()
      userTable.testBox[i] = box.text
      database.update({"testBox"})
	end
  end
end

module.close = function()
  return {"testBox"}
end

return module
