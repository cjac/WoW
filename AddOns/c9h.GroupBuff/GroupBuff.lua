--[[-------------------------------------------------------------------
--  GroupBuff.lua - Copyright 2017 - C.J. Collier <cjac@uw.edu>
--
-------------------------------------------------------------------]]--

local frame = CreateFrame("FRAME", "GroupBuffHelloFrame");

frame:RegisterEvent("PLAYER_ENTERING_WORLD");

frame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
function events:ACTIONBAR_UPDATE_COOLDOWN(self,button,...)
   if button != nil
   then
      print("Button pressed: " .. button)
   else
      print("Cooldown updated: " .. self)
   end
end

frame:RegisterEvent("ACTIONBAR_UPDATE_USABLE");
function events:ACTIONBAR_UPDATE_USABLE(self,...)
   print("Cooldown expired: " .. self)
end

local function eventHandler(self, event, ...)
  if events[event] ~= nil
  then 
     print("Hello World! Hello " .. event);
  else
     events[event](self, ...);
  end
end
frame:SetScript("OnEvent", eventHandler);
