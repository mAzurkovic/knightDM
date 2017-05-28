AddCSLuaFile()
 
SWEP.Author				= "Mattias"
SWEP.Base				= "weapon_base"
SWEP.PrintName			= "Short Sword"
SWEP.ViewModel			= "models/weapons/tfa_csgo/w_knife_karambit.mdl"
SWEP.ViewModelFlip		= false
SWEP.UseHands			= true
SWEP.WorldModel			= "models/weapons/tfa_csgo/w_knife_karambit.mdl"
SWEP.SetHoldType		= "melee"
SWEP.Weight				= 5
SWEP.AutoSwitchTo		= true
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 0
SWEP.SlotPos			= 0
SWEP.DrawCrosshair		= true
SWEP.Spawnable			= true
SWEP.AdminSpawnable 	= true

SWEP.Primary.ClipSize	= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Ammo			= "none"
SWEP.Primary.Automatic		= false

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Ammo			= "none"
SWEP.Secondary.Automatic	= false

SWEP.ShouldDropOnDie		= false

local SwingSound = Sound("Weapon_Crowbar.Single")
local HitSound = Sound("Weapon_Crowbar.Melee_Hit")

function SWEP:PrimaryAttack()
	if (CLIENT) then return end
	
	local ply = self:GetOwner();
	
	ply:LagConpensation(true)
	
	local shootpos = ply:GetShootPos()
	local endshootpos = shootpos + ply:GetAimVector() * 70
	local tmin = Vector(1, 1, 1) * -10
	local tmax = Vector(1, 1, 1) * 10
	
	local tr = util.TraceHull({
		start = shootpos,
		endpos = endshootpos,
		filter = ply,
		mask = MASK_SHOT_HULL,
		mins = tmix,
		maxs = tmax
	})
	
	if (not IsValid(tr.Entity)) then
		tr = util.TraceLine({
		start = shootpos,
		endpos = endshootpos,
		filter = ply,
		mask = MASK_SHOT_HULL
		})
	end
	
	local ent = tr.Entity
	
	if ( IsValid(ent) && (ent:IsPlayer() || ent:IsNPC()) ) then
		self.Weapon:SendWeapnAnim(ACT_VM_HITCENTER)
		ply:SetAnimation(PLAYER_ATTACK1)
		
		ply:EmitSound(HitSound)
		ent:SetHealth(ent:Health() - 25)
		
		if (ent:Health() < 1) then
			ent:Kill()
		end
		
	elseif (!IsValid(ent)) then
		self.Weapon:SendWeapnAnim(ACT_VM_MISSCENTER)
		ply:SetAnimation(PLAYER_ATTACK1)
		
		ply:EmitSound(SwingSound)
	end
	
	self:SetNextPrimaryFire(CurTime() + self:SequenceDuration() + 0.1)
	
	ply:LagConpensation(false)
end

function SWEP:CanSecondaryAttack()
	return false
end




