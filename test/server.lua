local settingstable = {}
local doortable = {}
local server = {}

local module = {}
module.name = "test"
module.commands = {}
module.skipcrypt = {}
module.table = {["testBox"]={}}
module.debug = false
function module.init(settings, doors, serverCommands)
  settingstable = settings
  doortable = doors
  server = serverCommands
end

function module.setup()

end

function module.message(command,data)
  if command == "test" then
    return true, {{["text"]="It worked!",["color"]=0xFFFFFF,["line"]=false}},false,true,"true"
  else

  end
  return false
end

function module.piggyback(command,data)

end

return module
