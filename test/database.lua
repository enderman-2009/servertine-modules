local module = {}
local GUI = require("GUI")

local userTable

local workspace, window, loc, database, style = table.unpack({...})

module.name = "test"
module.table = {"testBox","textDrop"}
module.debug = false
module.config = {}

module.init = function(usTable)
  userTable = usTable
end

module.onTouch = function()
  local thisInput = window:addChild(GUI.input(2,2,16,1,style.passInputBack,style.passInputText,style.passInputPlaceholder,style.passInputFocusBack,style.passInputFocusText,"text","textBox")) --sets textbox
  thisInput.text = userTable.testBox
  thisInput.onInputFinished = function()
    userTable.testBox = thisInput.text
    database.update({"testBox"})
  end
  local testDrop = window:addChild(GUI.comboBox(2,0,16,3,style.containerComboBack,style.containerComboText,style.containerComboArrowBack,style.containerComboArrowText))  --sets dropdown
  for i, v in pairs(userTable.testDrop)
	testDrop:addItem(v)
  end
  database.update({"testDrop"})
end

module.close = function()
  return {"testBox","testDrop"}
end

return module
