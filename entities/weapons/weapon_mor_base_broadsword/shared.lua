if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Morrowind Broadsword"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Morrowind Broadswords"
SWEP.Author			= "Doug Tyrrell + Mad Cow (Revisions by Neotanks) For LUA (Models, Textures, ect. By: Hellsing/JJSteel)"
SWEP.Instructions	= ""
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.ViewModelFOV	= 72
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
  
SWEP.ViewModel      = "models/morrowind/iron/broadsword/v_iron_broadsword.mdl"
SWEP.WorldModel   = "models/morrowind/iron/broadsword/w_iron_broadsword.mdl"

SWEP.Primary.Damage		= 50
SWEP.Primary.NumShots		= 0
SWEP.Primary.Delay 		= 0.50

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

function SWEP:Precache()
	util.PrecacheSound("weapons/broadsword/morrowind_broadsword_deploy1.wav")
	util.PrecacheSound("weapons/broadsword/morrowind_broadsword_hitwall1.wav")
	util.PrecacheSound("weapons/broadsword/morrowind_broadsword_hit.wav")
	util.PrecacheSound("weapons/broadsword/morrowind_broadsword_slash.wav")
end

function SWEP:Initialize()
    self:SetWeaponHoldType("melee")
	self.Hit = { 
	Sound( "weapons/broadsword/morrowind_broadsword_hitwall1.wav" )}
	self.FleshHit = {
  	Sound("weapons/broadsword/morrowind_broadsword_hit.wav") }
end

function SWEP:Deploy()
	self.Owner:EmitSound("weapons/broadsword/morrowind_broadsword_deploy1.wav")
	return true
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
	timer.Simple(.35, function()
		if !self.Owner then return end
		local trace = self.Owner:GetEyeTrace()
		if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
			if( trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass()=="prop_ragdoll" ) then
				self.Owner:EmitSound( self.FleshHit[math.random(1,#self.FleshHit)] )
			else
				self.Owner:EmitSound( self.Hit[math.random(1,#self.Hit)] )
			end
				bullet = {}
				bullet.Num    = 1
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(0, 0, 0)
				bullet.Tracer = 0
				bullet.Force  = 1
				bullet.Damage = 50
			self.Owner:FireBullets(bullet) 
			self.Owner:ViewPunch(Angle(7, 0, 0))
		else
			self.Weapon:EmitSound("weapons/broadsword/morrowind_broadsword_slash.wav")
		end
	end)
end

function SWEP:Holster()
	if self:GetNextPrimaryFire() > CurTime() then return end
	return true
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()
	self.Weapon:EmitSound("weapons/broadsword/morrowind_broadsword_slash.wav")
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_VM_HITCENTER)

	if (SERVER) then
		timer.Simple(.25, function()
			if !self.Owner then return end
			local knife = ents.Create("ent_mor_broadsword")
			knife:SetAngles(self.Owner:EyeAngles())
			local pos = self.Owner:GetShootPos()
				pos = pos + self.Owner:GetForward() * 5
				pos = pos + self.Owner:GetRight() * 9
				pos = pos + self.Owner:GetUp() * -5
			knife:SetPos(pos)
			knife:SetOwner(self.Owner)
			knife.Weapon = self		// Used to se the axe's model and the weapon it gives when used.
			knife:Spawn()
			knife:Activate()

			self.Owner:SetAnimation(PLAYER_ATTACK1)

			local phys = knife:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 1500)
			phys:AddAngleVelocity(Vector(0, 500, 0))
			self:Remove()
		end)
	end
end