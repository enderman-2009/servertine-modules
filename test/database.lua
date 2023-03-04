local module = {}
local GUI = require("GUI")

local userTable

local workspace, window, loc, database, style = table.unpack({...})

module.name = "test"
module.table = {"testBox1","textBox2"}
module.debug = false
module.config = {}

module.init = function(usTable)
  userTable = usTable
end

module.onTouch = function()
  local box1 = window:addChild(GUI.input(2,2,16,1,style.passInputBack,style.passInputText,style.passInputPlaceholder,style.passInputFocusBack,style.passInputFocusText,"text1","textBox1")) --sets textbox
  box1.text = userTable.testBox1
  box1.onInputFinished = function()
    userTable.testBox1 = box1.text
    database.update({"testBox1"})
  end
  local box2 = window:addChild(GUI.input(2,0,16,1,style.passInputBack,style.passInputText,style.passInputPlaceholder,style.passInputFocusBack,style.passInputFocusText,"text2","textBox2")) --sets textbox
  box2.text = userTable.testBox2
  box2.onInputFinished = function()
    userTable.testBox2 = box2.text
    database.update({"testBox2"})
  end
end

module.close = function()
  return {"testBox1","testBox2"}
end

return module
