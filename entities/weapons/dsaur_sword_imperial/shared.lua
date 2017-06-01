if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true
--SWEP.EffectActive	= true

--function SWEP:SpellEffect(atker,victim)
--end

SWEP.Base			= "dsaur_base_melee"
SWEP.WeaponType		= "2H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Longswords"

SWEP.PrintName 		= "Imperial Guard Spatha"
SWEP.Primary.Damage	= 21
SWEP.Primary.Delay 	= 1.2
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/imperial/shortsword/v_imperial_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/imperial/shortsword/w_imperial_shortsword.mdl"