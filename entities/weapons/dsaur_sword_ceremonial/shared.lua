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

SWEP.PrintName 		= "Ceremonial Broad Sword"
SWEP.Primary.Damage	= 20
SWEP.Primary.Delay 	= 0.8
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/ebony/shortsword/v_ebony_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/ebony/shortsword/w_ebony_shortsword.mdl"