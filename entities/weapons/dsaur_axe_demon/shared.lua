if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true

SWEP.Base			= "dsaur_base_melee"
SWEP.WeaponType		= "1H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Axes"

SWEP.PrintName 		= "Demonsteel Skullsplitter"
SWEP.Primary.Damage	= 24
SWEP.Primary.Delay 	= 1.1
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay.."\nSpell Effect: Steals 25% enemy's health on hit."
  
SWEP.ViewModel      = "models/morrowind/daedric/waraxe/v_daedricwaraxe.mdl"
SWEP.WorldModel   	= "models/morrowind/daedric/waraxe/w_daedricwaraxe.mdl"

SWEP.EffectActive	= true

function SWEP:SpellEffect(atker,victim)
	if !victim:IsPlayer() then return end
	local maxhp = atker:GetMaxHealth() + 30 
	local hp = atker:Health() + self.Primary.Damage*0.35
	if maxhp < hp then return end
	atker:SetHealth( math.Clamp( hp, 0, maxhp ) )
end