if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName 			= "FantasyRP Weapon Base"
	SWEP.Slot 				= 4
	SWEP.SlotPos 			= 1
	SWEP.DrawAmmo 			= false
	SWEP.DrawCrosshair 		= false
end

SWEP.Category 				= "FantasyRP Two Handed Weapon Base"
SWEP.Author					= "Bethesda, Neotanks, Doug Tyrrell, Mad Cow, Hellsing, JJglass, Lolzorz11"
SWEP.Instructions			= "Left Click: Cleave Enemy \nRight Click: Throw Weapon at Enemy"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.WeaponType				= "2H"
SWEP.ThrowType				= "blunt"

SWEP.ViewModelFOV			= 72
SWEP.ViewModelFlip			= false

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
  
SWEP.ViewModel    			= "models/morrowind/halberd/halberd/v_halberd.mdl"
SWEP.WorldModel   			= "models/morrowind/halberd/halberd/w_halberd.mdl"

SWEP.Primary.Damage			= 1
SWEP.Primary.NumShots		= 0
SWEP.Primary.Delay 			= 0.50
SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Delay 		= 0.50
SWEP.Secondary.Automatic	= true				// Automatic/Semi Auto
SWEP.Secondary.Ammo			= "none"

local Shield					= nil
SWEP.ShieldHolstered		= false

function SWEP:Precache()
	/**/if self.WeaponType == "2H" then
		util.PrecacheSound("weapons/halberd/morrowind_halberd_deploy1.wav")
		util.PrecacheSound("weapons/halberd/morrowind_halberd_hitwall1.wav")
		util.PrecacheSound("weapons/halberd/morrowind_halberd_hit.wav")
		util.PrecacheSound("weapons/halberd/morrowind_halberd_slash.wav")
	elseif self.WeaponType == "1H" then
		util.PrecacheSound("weapons/broadsword/morrowind_broadsword_deploy1.wav")
		util.PrecacheSound("weapons/broadsword/morrowind_broadsword_hitwall1.wav")
		util.PrecacheSound("weapons/broadsword/morrowind_broadsword_hit.wav")
		util.PrecacheSound("weapons/broadsword/morrowind_broadsword_slash.wav")
	elseif self.WeaponType == "PR" or self.WeaponType == "TR" then
		util.PrecacheSound("weapons/tanto/morrowind_tanto_deploy1.wav")
		util.PrecacheSound("weapons/tanto/morrowind_tanto_hitwall1.wav")
		util.PrecacheSound("weapons/tanto/morrowind_tanto_hit.wav")
		util.PrecacheSound("weapons/tanto/morrowind_tanto_slash.wav")
	end
end

function SWEP:Initialize()
	/**/if self.WeaponType == "2H" then
		self:SetWeaponHoldType("melee2")
		self.Hit 		= Sound( "weapons/halberd/morrowind_halberd_hitwall1.wav" )
		self.FleshHit 	= Sound( "weapons/halberd/morrowind_halberd_hit.wav" )
		self.Slash		= Sound( "weapons/halberd/morrowind_halberd_slash.wav" )
	elseif self.WeaponType == "1H" then
		self:SetWeaponHoldType("melee")
		self.Hit 		= Sound( "weapons/broadsword/morrowind_broadsword_hitwall1.wav" ) 
		self.FleshHit 	= Sound( "weapons/broadsword/morrowind_broadsword_hit.wav") 
		self.Slash		= Sound( "weapons/broadsword/morrowind_broadsword_slash.wav" ) 
	elseif self.WeaponType == "PR" then
		self:SetWeaponHoldType("knife")
		self.Hit 		= Sound( "weapons/tanto/morrowind_tanto_hitwall1.wav" ) 
		self.FleshHit 	= Sound( "weapons/tanto/morrowind_tanto_hit.wav") 
		self.Slash		= Sound( "weapons/tanto/morrowind_tanto_slash.wav" ) 
	elseif self.WeaponType == "TR" then
		self:SetWeaponHoldType("knife")
		self.Hit 					= Sound( "weapons/tanto/morrowind_tanto_hitwall1.wav" ) 
		self.FleshHit 				= Sound( "weapons/tanto/morrowind_tanto_hit.wav") 
		self.Slash					= Sound( "weapons/tanto/morrowind_tanto_slash.wav" ) 
		self.Primary.DefaultClip	= 5
		self.Primary.Ammo			= "XBowBolt"
	end
end

function SWEP:Deploy()
	self.Owner:SetViewOffset( Vector( 0, 0, 62 ) )

	/**/if self.WeaponType == "2H"
	  then self.Owner:EmitSound("weapons/halberd/morrowind_halberd_deploy1.wav")
	elseif self.WeaponType == "1H"
	  then self.Owner:EmitSound("weapons/broadsword/morrowind_broadsword_deploy1.wav")
	elseif self.WeaponType == "PR" or self.WeaponType == "TR"
	  then self.Owner:EmitSound("weapons/tanto/morrowind_tanto_deploy1.wav")
	end
	
	timer.Simple(0.25, function()
		if !SERVER then return end
		if IsValid(self.Shield) then return end
		if !(self.WeaponType == "1H") then return end
		
		local v = self.Owner:EyeAngles()
		self.Owner:SetEyeAngles(Angle(0,v.Y,v.R))
		
		timer.Simple(0.35, function()
			self.Shield = ents.Create("prop_physics")
			self.Shield:SetModel("models/skyrim/shield_stormcloaks.mdl")
			self.Shield:SetPos(self.Owner:GetPos() + Vector(1.5,0,45) + (self.Owner:GetForward()*15))
			self.Shield:SetAngles(Angle(270,self.Owner:EyeAngles().y,self.Owner:EyeAngles().r))
			self.Shield:SetParent(self.Owner)
			self.Shield:Fire("SetParentAttachmentMaintainOffset", "eyes", 0.01)
			self.Shield:SetCollisionGroup( COLLISION_GROUP_WORLD )
			self.Shield:Spawn()
			self.Shield:Activate()
		end)
	end)

	return true
end

function SWEP:OnDrop()
	if IsValid(self.Shield) then self.Shield:Remove() end
end

function SWEP:OnRemove()
	if IsValid(self.Shield) then self.Shield:Remove() end
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	self:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
	
	local tgt = self.Owner:GetEyeTrace()
	
	timer.Simple(.35, function()
		if !self.Owner then return end
		if tgt.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
			tgt = tgt.Entity
			if( tgt:IsPlayer() or tgt:IsNPC() or tgt:GetClass()=="prop_ragdoll" ) then
				self.Owner:EmitSound( self.FleshHit )
			else
				self.Owner:EmitSound( self.Hit )
			end
			
			bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = self.Primary.Damage
			
			self.Owner:FireBullets(bullet) 
			self.Owner:ViewPunch( Angle(7, 0, 0) )
			
			if self.EffectActive != nil then
				self:SpellEffect( self.Owner, tgt )
			end
		else
			self.Weapon:EmitSound( self.Slash )
		end
	end)
end

function SWEP:Holster()
	if self:GetNextPrimaryFire() > CurTime() then return end
	if IsValid(self.Shield) then self.Shield:Remove() end
	
	return true
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
	self.Weapon:EmitSound( self.Slash )
	self.Weapon:SetNextSecondaryFire( CurTime() + 3 )
	self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
	
	if CLIENT then
		local v = self.Owner:EyeAngles()
		self.Owner:SetEyeAngles(Angle(0,v.Y,v.R))
	end
	
	self:SetWeaponHoldType("normal")
	
	timer.Simple(0.35, function()
		if SERVER and IsValid(self.Shield) and self.Owner:Crouching() == false then 
			if self.ShieldHolstered == false then
				self.Owner:SetViewOffset( Vector( 0, 0, 48 ) )
				self.Shield:SetPos(self.Owner:GetPos() + Vector(1.5,0,55) + (self.Owner:GetForward()*-9))
				self.Shield:SetAngles(Angle(120,self.Owner:EyeAngles().y,self.Owner:EyeAngles().r))
				self.ShieldHolstered = true
			else 
				self.Owner:SetViewOffset( Vector( 0, 0, 62 ) )
				self.Shield:SetPos(self.Owner:GetPos() + Vector(1.5,0,45) + (self.Owner:GetForward()*15))
				self.Shield:SetAngles(Angle(270,self.Owner:EyeAngles().y,self.Owner:EyeAngles().r))
				self.ShieldHolstered = false
			end
		end
		self:SetWeaponHoldType("melee")
	end)
	
end

function SWEP:Remove()
end