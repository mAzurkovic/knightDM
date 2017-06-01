if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true

SWEP.Base			= "dsaur_base_melee"
SWEP.WeaponType		= "1H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Axes"

SWEP.PrintName 		= "Ornate Ebony Francisca"
SWEP.Primary.Damage	= 16
SWEP.Primary.Delay 	= 0.9
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay
  
SWEP.ViewModel      = "models/morrowind/ebony/axe/v_ebonyaxe.mdl"
SWEP.WorldModel   	= "models/morrowind/ebony/axe/w_ebonyaxe.mdl"

SWEP.EffectActive	= true

function SWEP:SpellEffect(atker,victim)
	if !victim:IsPlayer() then return end
	local md = victim:GetModel()
	
	if md == "models/player/goblin/goblin.mdl" -- Goblin
	or md == "models/player/undead/undead.mdl" -- Undead1
	or md == "models/player/charple.mdl" -- Undead2
	or md == "models/player/corpse1.mdl" -- Undead3
	or md == "models/player/zombie_fast.mdl" -- Undead4
	or md == "models/player/skeleton.mdl" -- Skeleton
	or md == "models/player/palpatine/palpatine.mdl" -- Necromancer
	or md == "models/player/ravenwarriorplayer.mdl" -- Ravenfolk
	or md == "models/mass effect 2/player/hanar.mdl" -- Squidfolk
	or md == "models/player/stenli/lycan_werewolf.mdl" -- Werewolf
	or md == "models/player/hellknight/hellknight.mdl" -- Ogre
	or md == "models/bm/gargantua.mdl" -- Apocalypse
	or md == "models/player/nihilus.mdl" -- Disciple
	or md == "models/player/miraak.mdl" -- High Priest
	or md == "models/player/darth_revan.mdl" -- Fallen Crusader
	or md == "models/player/daedric.mdl" -- Death Knight
	then if SERVER then victim:Ignite(2) end end
end