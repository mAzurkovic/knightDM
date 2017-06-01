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
SWEP.Category		= "FantasyRP Axes"

SWEP.PrintName 		= "Brutal Sagaris Axe"
SWEP.Primary.Damage	= 42
SWEP.Primary.Delay 	= 1.75
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay
  
SWEP.ViewModel      = "models/morrowind/orcish/waraxe/v_orcishwaraxe.mdl"
SWEP.WorldModel   	= "models/morrowind/orcish/waraxe/w_orcishwaraxe.mdl"