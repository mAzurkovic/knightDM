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

SWEP.PrintName 		= "Steel Arming Sword"
SWEP.Primary.Damage	= 15
SWEP.Primary.Delay 	= 1
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/steel/shortsword/v_steel_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/steel/shortsword/w_steel_shortsword.mdl"