if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Steel Saber"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Morrowind Sabers"
SWEP.Author			= "Doug Tyrrell + Mad Cow (Revisions by Neotanks) for LUA (Models, Textures, ect. By: Hellsing/JJsteel)"
SWEP.Base			= "weapon_mor_base_broadsword"
SWEP.Instructions	= "Left click to stab/slash/lunge and right click to throw, also capable of badassery."
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.ViewModelFOV	= 72
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
  
SWEP.ViewModel      = "models/morrowind/steel/saber/v_steel_saber.mdl"
SWEP.WorldModel   = "models/morrowind/steel/saber/w_steel_saber.mdl"

SWEP.Primary.Damage		= 25
SWEP.Primary.NumShots		= 0
SWEP.Primary.Delay 		= .4

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"