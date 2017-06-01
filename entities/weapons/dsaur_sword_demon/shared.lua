if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

SWEP.Spawnable		= true
SWEP.AdminSpawnable	= true

SWEP.Base			= "dsaur_base_melee"
SWEP.WeaponType		= "1H"
SWEP.ThrowType		= "sharp"
SWEP.Category		= "FantasyRP Swords"

SWEP.PrintName 		= "Demonsteel Cultist Sword"
SWEP.Primary.Damage	= 12
SWEP.Primary.Delay 	= 0.8
SWEP.Purpose		= "Damage: "..SWEP.Primary.Damage.."\nAttack Delay: "..SWEP.Primary.Delay.."\nDamage Per Second: "..SWEP.Primary.Damage/SWEP.Primary.Delay

SWEP.ViewModel      = "models/morrowind/daedric/shortsword/v_daedric_shortsword.mdl"
SWEP.WorldModel   	= "models/morrowind/daedric/shortsword/w_daedric_shortsword.mdl"

SWEP.EffectActive	= true

function SWEP:SpellEffect(atker,victim)
	if !victim:IsPlayer() then return end
	local maxhp = atker:GetMaxHealth() + 30 
	local hp = atker:Health() + self.Primary.Damage*0.35
	if maxhp < hp then return end
	atker:SetHealth( math.Clamp( hp, 0, maxhp ) )
end