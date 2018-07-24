--------------------------------
-- Fire Script, Made by FAXES --
--------------------------------
--- COMMANDS ---
AddEventHandler("chatMessage", function(p, color, msg)
		
	RegisterCommand('firestart', function()
		TriggerClientEvent("chatMessage", p, "FIRE Script ", {255, 165, 30}, "Fire Started")
		TriggerClientEvent("lol:firethings", p)
		CancelEvent()
	end)
	
	RegisterCommand('firestop', function()
		TriggerClientEvent("chatMessage", p, "FIRE Script ", {255, 165, 30}, "Fire(s) Stopped")
		TriggerClientEvent("lol:firestop", p)
		TriggerClientEvent("lol:firesync", -1)
		CancelEvent()
	end)
	
	RegisterCommand('firecount', function()
		TriggerClientEvent("lol:firecounter", p)
		CancelEvent()
	end)
	
	RegisterCommand('carbomb', function()
		TriggerClientEvent("lol:carbomb", p)
		CancelEvent()
	end)
	
	RegisterCommand('firetest', function()
		TriggerClientEvent("lol:test1", p)
		CancelEvent()
	end)
	
	RegisterCommand('firesync', function()
		TriggerClientEvent("lol:firesync3", p)
	end)
	
	RegisterCommand('firehelp', function()
		TriggerClientEvent("chatMessage", p, "FIRE Script ", {255, 165, 30}, "You can start a big fire by typing /firestart, and you can also start a single fire by pressing the home key! /carbomb blows up the last car you entered and starts a big fire around it!")
		CancelEvent()
	end
end)

--- CODE ---

print("Fire Script has loaded! Coded by Rjross2013")

RegisterServerEvent("lol:startfire")
AddEventHandler("lol:startfire", function( x , y , z , args, p)
	TriggerClientEvent("chatMessage", p, "LOL ", {255, 0, 0}, "it got to server.")
	maxChilds = args[1]
	isGas = args[2]
	gasFire = false
	if (isGas == 1) then
		gasFire = true
	end
	TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(y))
	TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(maxChilds))
	TriggerClientEvent("chatMessage", p, "INFO", {255, 0, 0}, tostring(gasFire))
	StartScriptFire(x, y, z, maxChilds, gasFire)
end)
RegisterServerEvent('fire:chatAlert')
AddEventHandler('fire:chatAlert', function( text )  
    TriggerClientEvent('chatMessage', -1, 'FIRE', {255, 0, 0}, 'A fire has been spotted at: ' .. text)
end)
 RegisterServerEvent("lol:firesyncs")
 AddEventHandler("lol:firesyncs", function( firec, lastamnt, deletedfires, original )
	--local test = ping
	TriggerClientEvent("lol:firesyncs2", -1, firec, lastamnt, deletedfires, original)
	--TriggerClientEvent("lol:firesync3", -1)
 end)
  RegisterServerEvent("lol:fireremovesyncs2")
 AddEventHandler("lol:fireremovesyncs2", function( firec, lastamnt, deletedfires, original )
	--local test = ping
	TriggerClientEvent("lol:fireremovesync", -1, firec, lastamnt, deletedfires, original)
 end)
 RegisterServerEvent("lol:firesyncs60")
 AddEventHandler("lol:firesyncs60", function()
	--local test = ping
	--TriggerClientEvent("lol:firesyncs2", -1, firec, lastamnt, deletedfires, original)
	TriggerClientEvent("lol:firesync3", -1)
 end)
  RegisterServerEvent("lol:removefires")
 AddEventHandler("lol:removefires", function( x, y, z, i )
	local test = i
	--local test = ping
	TriggerClientEvent("lol:fireremovess", -1, x, y, z, test)
	--TriggerClientEvent("lol:firesync3", -1)
 end)


function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end