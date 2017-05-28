AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

playerClass = 0

function GM:PlayerConnect(name, ip)
  print("Server: Player " .. name .. " is connecting...")
end

function GM:PlayerInitialSpawn(ply)
  print("Server: Player " .. ply:Nick() .. " is spawning...")
  ply:ConCommand( "change_class" ) --Run the console command when the player first spawns
end

function GM:PlayerAuthed(ply, steamID, uniqueID)
  print("Server: Player " .. ply:Nick() .. " has been authed...")
end

-- Initial spawn
function GM:PlayerLoadout(ply) --"The weapons/items that the player spawns with" function
	ply:StripWeapons()

	if playerClass == 1 then
		ply:Give("weapon_crossbow")
		ply:Give("weapon_357")
	elseif playerClass == 2 then
		ply:Give("weapon_crossbow")
		ply:Give("weapon_357")
	elseif playerClass == 3 then
		ply:Give("weapon_crossbow")
	elseif playerClass == 4 then
		ply:Give("weapon_357")
	end

end

function GM:PlayerSetModel( ply )
	ply:SetModel( "models/player/odessa.mdl" )
end

function archer( ply )
	playerClass = 1
	ply:Spawn()
end

function knight( ply )
	playerClass = 2
	ply:Spawn()
end

function heavy( ply )
	playerClass = 3
	ply:Spawn()
end

function light( ply )
	playerClass = 4
	ply:Spawn()
end

concommand.Add( "archer", archer )
concommand.Add( "knight", knight )
concommand.Add( "light", light )
concommand.Add( "heavy", heavy )


