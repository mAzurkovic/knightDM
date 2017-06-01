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

SWEP.PrintName 		= "Animal Bone Maceaxe"
SWEP.Primary.Damage	= 13
SWEP.Primary.Delay 	= 1.25
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay
  
SWEP.ViewModel      = "models/morrowind/chitin/axe/v_chitinaxe.mdl"
SWEP.WorldModel   	= "models/morrowind/chitin/axe/w_chitinaxe.mdl"