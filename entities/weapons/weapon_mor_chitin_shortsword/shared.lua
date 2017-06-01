if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Chitin Short Sword"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Morrowind Shortswords"
SWEP.Author			= "Doug Tyrrell + Mad Cow (Revisions by Neotanks) for LUA (Models, Textures, ect. By: Hellsing/JJchitin)"
SWEP.Base			= "weapon_mor_base_shortsword"
SWEP.Instructions	= "Left click to stab/slash/lunge and right click to throw, also capable of badassery."
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.ViewModelFOV	= 72
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
  
SWEP.ViewModel      = "models/morrowind/chitin/shortsword/v_chitin_shortsword.mdl"
SWEP.WorldModel   = "models/morrowind/chitin/shortsword/w_chitin_shortsword.mdl"

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