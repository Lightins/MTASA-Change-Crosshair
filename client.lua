crosshairid = "1"
function onStart()
    local config = xmlLoadFile("config.xml")
    if config then
        crosshairid = xmlNodeGetAttribute(config,"crosshairid")
    else
        config = xmlCreateFile("config.xml","crosshair")
        xmlNodeSetAttribute(config, "crosshairid", crosshairid)
        xmlSaveFile(config)
		xmlUnloadFile ( config )
    end
	createCrosshair(crosshairid)
end
addEventHandler("onClientResourceStart", resourceRoot, onStart)

function createCrosshair(chid)
	local config = xmlLoadFile("config.xml")
	if config then
		xmlNodeSetAttribute(config, "crosshairid", chid)
        xmlSaveFile(config)
		xmlUnloadFile ( config )
	end
	Crosshair = {
	crosshairs = {};
	shader = {};
	default = dxCreateTexture(tostring(chid)..".png");
	
	register = function(weaponid, crosshairpath)
		if not crosshairpath:find(":") then
			crosshairpath = (":%s/%s"):format(getResourceName(sourceResource), crosshairpath)
		end
		assert(fileExists(crosshairpath), "Invalid File for Crosshair.register")
		
		if Crosshair.crosshairs[weaponid] then destroyElement(Crosshair.crosshairs[weaponid]) end
		Crosshair.crosshairs[weaponid] = dxCreateTexture(crosshairpath)
	end,
	
	unregister = function(weaponid)
		if Crosshair.crosshairs[weaponid] then destroyElement(Crosshair.crosshairs[weaponid]) end
		Crosshair.crosshairs[weaponid] = nil
	end,
	
	init = function()
		Crosshair.shader = dxCreateShader("texreplace.fx")
		assert(Crosshair.shader, "Could not create Crosshair Replacement Shader")
		engineApplyShaderToWorldTexture(Crosshair.shader, "siteM16")
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.default)
		addEventHandler("onClientPlayerWeaponSwitch", localPlayer, Crosshair.weaponSwitch)
	end, 

	weaponSwitch = function(prev, now)
		local weapon = getPedWeapon(localPlayer)
		dxSetShaderValue(Crosshair.shader, "gTexture", Crosshair.crosshairs[weapon] or Crosshair.default)
	end
}

Crosshair.init()

-- Exports
register 	= Crosshair.register
unregister 	= Crosshair.unregister
end

local myWindow = guiCreateWindow ( 0.25, 0.25, 0.5, 0.4, "Crosshair", true )
local ch1 = guiCreateRadioButton(0,0.1,0.05,0.05,"1",true, myWindow)
guiCreateStaticImage( 0, 0.05, 0.05, 0.05, "1.png", true, myWindow )
guiRadioButtonSetSelected(ch1,true)
local ch2 = guiCreateRadioButton(0.1,0.1,0.05,0.05,"2",true, myWindow)
guiCreateStaticImage( 0.1, 0.05, 0.05, 0.05, "2.png", true, myWindow )

local ch3 = guiCreateRadioButton(0.2,0.1,0.05,0.05,"3",true, myWindow)
guiCreateStaticImage( 0.2, 0.05, 0.05, 0.05, "3.png", true, myWindow )

local ch4 = guiCreateRadioButton(0.3,0.1,0.05,0.05,"4",true, myWindow)
guiCreateStaticImage( 0.3, 0.05, 0.05, 0.05, "4.png", true, myWindow )

local ch5 = guiCreateRadioButton(0.4,0.1,0.05,0.05,"5",true, myWindow)
guiCreateStaticImage( 0.4, 0.05, 0.05, 0.05, "5.png", true, myWindow )

local ch6 = guiCreateRadioButton(0.5,0.1,0.05,0.05,"6",true, myWindow)
guiCreateStaticImage( 0.5, 0.05, 0.05, 0.05, "6.png", true, myWindow )

local ch7 = guiCreateRadioButton(0.6,0.1,0.05,0.05,"7",true, myWindow)
guiCreateStaticImage( 0.6, 0.05, 0.05, 0.05, "7.png", true, myWindow )

local ch8 = guiCreateRadioButton(0.7,0.1,0.05,0.05,"8",true, myWindow)
guiCreateStaticImage( 0.7, 0.05, 0.05, 0.05, "8.png", true, myWindow )

local ch9 = guiCreateRadioButton(0.8,0.1,0.05,0.05,"9",true, myWindow)
guiCreateStaticImage( 0.8, 0.05, 0.05, 0.05, "9.png", true, myWindow )

local ch10 = guiCreateRadioButton(0.9,0.1,0.05,0.05,"10",true, myWindow)
guiCreateStaticImage( 0.9, 0.05, 0.05, 0.05, "10.png", true, myWindow )

-- next line
local ch11 = guiCreateRadioButton(0,0.3,0.05,0.05,"11",true, myWindow)
guiCreateStaticImage( 0, 0.25, 0.05, 0.05, "11.png", true, myWindow )

local ch12 = guiCreateRadioButton(0.1,0.3,0.05,0.05,"12",true, myWindow)
guiCreateStaticImage( 0.1, 0.25, 0.05, 0.05, "12.png", true, myWindow )

local ch13 = guiCreateRadioButton(0.2,0.3,0.05,0.05,"13",true, myWindow)
guiCreateStaticImage( 0.2, 0.25, 0.05, 0.05, "13.png", true, myWindow )

local ch14 = guiCreateRadioButton(0.3,0.3,0.05,0.05,"14",true, myWindow)
guiCreateStaticImage( 0.3, 0.25, 0.05, 0.05, "14.png", true, myWindow )

local ch15 = guiCreateRadioButton(0.4,0.3,0.05,0.05,"15",true, myWindow)
guiCreateStaticImage( 0.4, 0.25, 0.05, 0.05, "15.png", true, myWindow )

local ch16 = guiCreateRadioButton(0.5,0.3,0.05,0.05,"16",true, myWindow)
guiCreateStaticImage( 0.5, 0.25, 0.05, 0.05, "16.png", true, myWindow )

local ch17 = guiCreateRadioButton(0.6,0.3,0.05,0.05,"17",true, myWindow)
guiCreateStaticImage( 0.6, 0.25, 0.05, 0.05, "17.png", true, myWindow )

local ch18 = guiCreateRadioButton(0.7,0.3,0.05,0.05,"18",true, myWindow)
guiCreateStaticImage( 0.7, 0.25, 0.05, 0.05, "18.png", true, myWindow )

local ch19 = guiCreateRadioButton(0.8,0.3,0.05,0.05,"19",true, myWindow)
guiCreateStaticImage( 0.8, 0.25, 0.05, 0.05, "19.png", true, myWindow )

local ch20 = guiCreateRadioButton(0.9,0.3,0.05,0.05,"20",true, myWindow)
guiCreateStaticImage( 0.9, 0.25, 0.05, 0.05, "20.png", true, myWindow )

local button = guiCreateButton( 0.7, 0.9, 0.3, 0.2, "Change!", true, myWindow )
guiSetVisible(myWindow, false)

function closeWindow()
	guiSetVisible(myWindow, false)
    showCursor(false)
    guiSetInputEnabled(false)
end

function createWindow()
  if guiGetVisible(myWindow) then
    guiSetVisible(myWindow, false)
    showCursor(false)
    guiSetInputEnabled(false)
  else
    guiSetVisible(myWindow, true)
    showCursor(true)
    guiSetInputEnabled(true)
  end
end
bindKey("F5", "down", createWindow)

function changeCross()
   if source == button then
		if(guiRadioButtonGetSelected(ch1))then
			createCrosshair(1)
		elseif(guiRadioButtonGetSelected(ch2)) then
			createCrosshair(2)
		elseif(guiRadioButtonGetSelected(ch3)) then
			createCrosshair(3)		
		elseif(guiRadioButtonGetSelected(ch4)) then
			createCrosshair(4)
		elseif(guiRadioButtonGetSelected(ch5)) then
			createCrosshair(5)	
		elseif(guiRadioButtonGetSelected(ch6)) then
			createCrosshair(6)		
		elseif(guiRadioButtonGetSelected(ch7)) then
			createCrosshair(7)
		elseif(guiRadioButtonGetSelected(ch8)) then
			createCrosshair(8)
		elseif(guiRadioButtonGetSelected(ch9)) then		
			createCrosshair(9)
		elseif(guiRadioButtonGetSelected(ch10)) then
			createCrosshair(10)
		elseif(guiRadioButtonGetSelected(ch11)) then
			createCrosshair(11)
		elseif(guiRadioButtonGetSelected(ch12)) then
			createCrosshair(12)
		elseif(guiRadioButtonGetSelected(ch13)) then
			createCrosshair(13)
		elseif(guiRadioButtonGetSelected(ch14)) then
			createCrosshair(14)
		elseif(guiRadioButtonGetSelected(ch15)) then
			createCrosshair(15)
		elseif(guiRadioButtonGetSelected(ch16)) then
			createCrosshair(16)
		elseif(guiRadioButtonGetSelected(ch17)) then
			createCrosshair(17)
		elseif(guiRadioButtonGetSelected(ch18)) then
			createCrosshair(18)
		elseif(guiRadioButtonGetSelected(ch19)) then
			createCrosshair(19)
		elseif(guiRadioButtonGetSelected(ch20)) then
			createCrosshair(20)
		end
		closeWindow()
  end
end
addEventHandler("onClientGUIClick", getRootElement(), changeCross)