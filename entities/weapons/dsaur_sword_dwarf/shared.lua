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
SWEP.Category		= "FantasyRP Swords"

SWEP.PrintName 		= "Dwarvern Steel Cinquedea"
SWEP.Primary.Damage	= 35
SWEP.Primary.Delay 	= 1.25
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/dwemer/shortsword/v_dwemer_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/dwemer/shortsword/w_dwemer_shortsword.mdl"
