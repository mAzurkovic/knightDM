if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true
--SWEP.EffectActive	= true

--function SWEP:SpellEffect(atker,victim)
--end

SWEP.Base			= "dsaur_base_melee"
SWEP.WeaponType		= "1H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Longswords"

SWEP.PrintName 		= "Iron Broadsword"
SWEP.Primary.Damage	= 10
SWEP.Primary.Delay 	= 1
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/iron/shortsword/v_iron_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/iron/shortsword/w_iron_shortsword.mdl"