if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Dwemer Battle Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Morrowind Axes"
SWEP.Author			= "Doug Tyrrell + Mad Cow For LUA (Models, Textures, ect. By: Hellsing/JJSteel)"
SWEP.Instructions	= "Left click to stab/slash/lunge and right click to throw, Throwing will be cabable on all future weapons for added coolness/badassery."
SWEP.Contact		= ""
SWEP.Purpose		= "A Dwemer Battleaxe, though heavier than steel, are highly sought after for their resistance to corrosion, unmatched craftsmanship, their ability to keep an edge, and even just for their rarity. Dwarven items have not been produced since the disappearance of the Dwemer long ago and are truly a treasure whether in the battlefield or on display."

SWEP.ViewModelFOV	= 72
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.NextStrike = 0;
  
SWEP.ViewModel      = "models/morrowind/dwemer/battleaxe/v_dwemerbattleaxe.mdl"
SWEP.WorldModel   = "models/morrowind/dwemer/battleaxe/w_dwemerbattleaxe.mdl"
  
SWEP.Primary.Recoil		= 5
SWEP.Primary.Damage		= 0
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0.075
SWEP.Primary.Delay 		= 0.5

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "XBowBolt"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "none"				// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0

SWEP.Pistol				= true
SWEP.Rifle				= false
SWEP.Shotgun			= false
SWEP.Sniper				= false

SWEP.RunArmOffset 		= Vector (0.3671, 0.1571, 5.7856)
SWEP.RunArmAngle	 		= Vector (-37.4833, 2.7476, 0)

SWEP.Sequence			= 0


util.PrecacheSound("weapons/axe/morrowind_axe_deploy1.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_hitwall1.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_hit.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_slash.wav")

function SWEP:Initialize()
    	self:SetWeaponHoldType("melee2")
	self.Hit = { 
	Sound( "weapons/axe/morrowind_axe_hitwall1.wav" )}
	self.FleshHit = {
  	Sound("weapons/axe/morrowind_axe_hit.wav") }
end


function SWEP:Precache()
end

function SWEP:Deploy()
	self.Owner:EmitSound("weapons/axe/morrowind_axe_deploy1.wav")
	return true
end

function SWEP:PrimaryAttack()
	if( CurTime() < self.NextStrike ) then return; end
	self.NextStrike = ( CurTime() + .5 )
 	local trace = self.Owner:GetEyeTrace()
	if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
		if( trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass()=="prop_ragdoll" ) then
			self.Owner:EmitSound( self.FleshHit[math.random(1,#self.FleshHit)] )
		else
			self.Owner:EmitSound( self.Hit[math.random(1,#self.Hit)] )
		end
			self.Owner:SetAnimation( PLAYER_ATTACK1 )
			self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
				bullet = {}
				bullet.Num    = 1
				bullet.Src    = self.Owner:GetShootPos()
				bullet.Dir    = self.Owner:GetAimVector()
				bullet.Spread = Vector(0, 0, 0)
				bullet.Tracer = 0
				bullet.Force  = 1
				bullet.Damage = 50
			self.Owner:FireBullets(bullet) 
	else
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
		self.Weapon:EmitSound("weapons/axe/morrowind_axe_slash.wav")
	end
end

function RemoveKnife( ent )
	if ent:IsValid() then
		ent:Remove()
	end
end

/*---------------------------------------------------------
   Name: SWEP:SecondaryAttack()
   Desc: +attack2 has been pressed.
---------------------------------------------------------*/
function SWEP:SecondaryAttack()

	if self.Weapon:GetNetworkedBool("Holsted") or self.Owner:KeyDown(IN_SPEED) or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 1 then return end

	self.Weapon:EmitSound("weapons/axe/morrowind_axe_slash.wav")
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Owner:RemoveAmmo(1, self.Primary.Ammo)

	if (SERVER) then
		local knife = ents.Create("ent_dwemer_battleaxe")
		knife:SetAngles(self.Owner:EyeAngles())

//		if (self:GetIronsights() == false) then
			local pos = self.Owner:GetShootPos()
				pos = pos + self.Owner:GetForward() * 5
				pos = pos + self.Owner:GetRight() * 9
				pos = pos + self.Owner:GetUp() * -5
			knife:SetPos(pos)
//		else
//			knife:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector()))
//		end

		knife:SetOwner(self.Owner)
		knife:SetPhysicsAttacker(self.Owner)
		knife:Spawn()
		knife:Activate()

		self.Owner:SetAnimation(PLAYER_ATTACK1)

		local phys = knife:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * 1500)
		phys:AddAngleVelocity(Vector(0, 500, 0))
	end
end