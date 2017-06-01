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

SWEP.PrintName 		= "Rusty Iron Sabre"
SWEP.Primary.Damage	= 24
SWEP.Primary.Delay 	= 1.4
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/iron/saber/v_iron_saber.mdl"
SWEP.WorldModel   	= "models/morrowind/iron/saber/w_iron_saber.mdl"