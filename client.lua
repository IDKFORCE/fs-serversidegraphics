function stringsplit(inputstr, sep)
	if sep == nil then
	  sep = "%s"
	end
  
	local t = {} ; i = 1
  
	if inputstr == nil then
	  return t
	end
  
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
	  t[i] = str
	  i = i + 1
	end
  
	return t
  end
  
   
local function starts_with(str, start)
   return str:sub(1, #start) == start
end

CreateThread(function()
	local settingsFile = LoadResourceFile(GetCurrentResourceName(), "visualsettings.dat")

	local lines = stringsplit(settingsFile, "\n")

	for k,v in ipairs(lines) do
		if not starts_with(v, '#') and not starts_with(v, '//') and (v ~= "" or v ~= " ") and #v > 1 then
			v = v:gsub("%s+", " ")

			local setting = stringsplit(v, " ")

			if setting[1] ~= nil and setting[2] ~= nil and tonumber(setting[2]) ~= nil then
				if setting[1] ~= 'weather.CycleDuration' then	
					Citizen.InvokeNative(GetHashKey('SET_VISUAL_SETTING_FLOAT') & 0xFFFFFFFF, setting[1], tonumber(setting[2])+.0)
				end
			end
		end
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print('Made By ForceScripts')
	print('For Suport Join The Discord: (https://discord.com/invite/UFng7DWnWP)')
end)