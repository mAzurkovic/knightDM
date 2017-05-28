include("shared.lua")

function changeClass()

	local frame = vgui.Create( "DFrame" )
	frame:SetSize( 600, 450 )
	frame:Center()
	frame:SetTitle( "Choose Class" )
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( true )
	frame:MakePopup()

	-- Different classes
	archer = vgui.Create("DButton", frame)
	archer:SetSize(100, 50)
	archer:SetPos(20,50)
	archer:SetText("Archer")
	archer.DoClick = function() --Make the player join team 1
		RunConsoleCommand( "archer" )
	end

	knight = vgui.Create("DButton", frame)
	knight:SetSize(100, 50)
	knight:SetPos(140,50)
	knight:SetText("Knight")
	knight.DoClick = function() --Make the player join team 1
		RunConsoleCommand( "knight" )
	end

	heavy = vgui.Create("DButton", frame)
	heavy:SetSize(100, 50)
	heavy:SetPos(260,50)
	heavy:SetText("Knight")
	heavy.DoClick = function() --Make the player join team 1
		RunConsoleCommand( "heavy" )
	end

	light = vgui.Create("DButton", frame)
	light:SetSize(100, 50)
	light:SetPos(380,50)
	light:SetText("Light")
	light.DoClick = function() --Make the player join team 1
		RunConsoleCommand( "light" )
	end
end

concommand.Add( "change_class", changeClass )

surface.CreateFont( "HUDFont", {
	font = "Consolas", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "HPFont", {
	font = "Consolas", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 800,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

print(playerClass)

hook.Add( "HUDPaint", "HealthContainer", function()

	local plyHealth = LocalPlayer():Health()
	
	draw.RoundedBox(5, 30, ScrH() - 230, 350, 200, Color(0, 0, 0, 250))
	
	surface.SetTextPos(50, ScrH() - 220)
	surface.SetFont("HUDFont")
	surface.SetTextColor(Color(255, 255, 255))
	surface.DrawText(LocalPlayer():Nick())
	
	draw.RoundedBox(5, 45, ScrH() - 180, 308, 40, Color(255, 255, 200, 250))
	draw.RoundedBox(1, 49, ScrH() - 177, plyHealth * 3, 35, Color(255, 100, 100, 250))
	
	surface.SetTextPos(175, ScrH() - 173)
	surface.SetFont("HPFont")
	surface.SetTextColor(Color(255, 255, 255))
	surface.DrawText(plyHealth .. "%")
	
	if (LocalPlayer():Team() == 1) then
		surface.SetTextPos(50, ScrH() - 125)
		surface.SetFont("HPFont")
		surface.SetTextColor(Color(255, 255, 255))
		surface.DrawText("Team 1")
	elseif (LocalPlayer():Team() == 2) then
		surface.SetTextPos(50, ScrH() - 125)
		surface.SetFont("HPFont")
		surface.SetTextColor(Color(255, 255, 255))
		surface.DrawText("Team 2")
	end
	
end )

-- Hide the default HUD elements
local tohide = { -- This is a table where the keys are the HUD items to hide
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true
}
local function HUDShouldDraw(name) -- This is a local function because all functions should be local unless another file needs to run it
	if (tohide[name]) then     -- If the HUD name is a key in the table
		return false;      -- Return false.
	end
end
hook.Add("HUDShouldDraw", "How to: HUD Example HUD hider", HUDShouldDraw)