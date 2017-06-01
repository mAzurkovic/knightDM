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
SWEP.WeaponType		= "1H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Axes"

SWEP.PrintName 		= "Crude Iron Dane Axe"
SWEP.Primary.Damage	= 11
SWEP.Primary.Delay 	= 1.1
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay
  
SWEP.ViewModel      = "models/morrowind/iron/axe/v_ironaxe.mdl"
SWEP.WorldModel   	= "models/morrowind/iron/axe/w_ironaxe.mdl"