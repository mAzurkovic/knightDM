AddCSLuaFile("shared.lua")
--models
resource.AddFile("models/weapons/w_katana.mdl")
resource.AddFile("models/weapons/v_katana.mdl")

--materials
resource.AddFile("materials/models/weapons/v_katana/katana_normal.vtf")
resource.AddFile("materials/models/weapons/v_katana/katana.vtf")
resource.AddFile("materials/models/weapons/v_katana/katana.vmt")

resource.AddFile("materials/vgui/weapons/weapon_mse_katana.vtf")
resource.AddFile("materials/vgui/weapons/weapon_mse_katana.vmt")

--sounds
resource.AddFile("sound/weapons/katana/katana_glass_hit_1.wav")
resource.AddFile("sound/weapons/katana/katana_glass_hit_2.wav")
resource.AddFile("sound/weapons/katana/katana_glass_hit_3.wav")
resource.AddFile("sound/weapons/katana/katana_wood_hit_1.wav")
resource.AddFile("sound/weapons/katana/katana_wood_hit_2.wav")
resource.AddFile("sound/weapons/katana/katana_wood_hit_3.wav")
resource.AddFile("sound/weapons/katana/katana_ground_hit_1.wav")
resource.AddFile("sound/weapons/katana/katana_ground_hit_2.wav")
resource.AddFile("sound/weapons/katana/katana_ground_hit_3.wav")
resource.AddFile("sound/weapons/katana/katana_ground_hit_4.wav")
resource.AddFile("sound/weapons/katana/katana_ground_hit_5.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_1.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_2.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_3.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_4.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_5.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_6.wav")
resource.AddFile("sound/weapons/katana/katana_metal_hit_7.wav")
resource.AddFile("sound/weapons/katana/katana_draw.wav")
end

if( CLIENT ) then
SWEP.BounceWeaponIcon = false
SWEP.WepSelectIcon = surface.GetTextureID("vgui/weapons/weapon_mse_katana")
killicon.Add("weapon_mse_katana","vgui/weapons/weapon_mse_katana",Color(255,255,255,255))
end

SWEP.PrintName = "Godsword"
SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.Author = "Scarguy"
SWEP.Instructions = "Secondary attack changed with 'r'"
SWEP.Contact = "N/A"
SWEP.Purpose = "End life"
SWEP.Category = "Scarguy's Godswords"

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.HoldType = "melee2"
SWEP.ViewModel = "models/weapons/c_katana.mdl"
SWEP.WorldModel = "models/weapons/w_katana.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound( "" )
SWEP.Primary.Delay = 0.4
SWEP.Primary.Recoil = 0
SWEP.Primary.Damage = 1
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Ammo = "none"
SWEP.SwingSound = Sound("weapons/katana/katana_swing_miss1.wav")

function SWEP:Initialize()
if (SERVER) then
self:SetHoldType( self.HoldType )
end

SWoodHit = {
Sound( "weapons/katana/katana_wood_hit_1.wav" ),
Sound( "weapons/katana/katana_wood_hit_2.wav" ),
Sound( "weapons/katana/katana_wood_hit_3.wav" )
}

SFleshHit = {
Sound( "ambient/machines/slicer1.wav" ),
Sound( "ambient/machines/slicer2.wav" ),
Sound( "ambient/machines/slicer3.wav" ),
Sound( "ambient/machines/slicer4.wav" )
}

SGlassHit = {
Sound( "weapons/katana/katana_glass_hit_1.wav" ),
Sound( "weapons/katana/katana_glass_hit_2.wav" ),
Sound( "weapons/katana/katana_glass_hit_3.wav" )
}

SMetalHit = {
Sound( "weapons/katana/katana_metal_hit_1.wav" ),
Sound( "weapons/katana/katana_metal_hit_2.wav" ),
Sound( "weapons/katana/katana_metal_hit_3.wav" ),
Sound( "weapons/katana/katana_metal_hit_4.wav" ),
Sound( "weapons/katana/katana_metal_hit_5.wav" ),
Sound( "weapons/katana/katana_metal_hit_6.wav" ),
Sound( "weapons/katana/katana_metal_hit_7.wav" )
}

SGroundHit = {
Sound( "weapons/katana/katana_ground_hit_1.wav" ),
Sound( "weapons/katana/katana_ground_hit_2.wav" ),
Sound( "weapons/katana/katana_ground_hit_3.wav" ),
Sound( "weapons/katana/katana_ground_hit_4.wav" ),
Sound( "weapons/katana/katana_ground_hit_5.wav" )
}

self.FleshHit = {
Sound( "weapons/katana/melee_katana_01.wav" ),
Sound( "weapons/katana/melee_katana_02.wav" ),
Sound( "weapons/katana/melee_katana_03.wav" )
}
end

function SWEP:Precache()
end

function SWEP:Deploy()
self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
self:SetNextPrimaryFire(CurTime() + 0.7)
self.Weapon:EmitSound("weapons/katana/katana_draw.wav")
return true
end

function SWEP:PrimaryAttack()
self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
self.Owner:SetAnimation(PLAYER_ATTACK1)
self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

self.Weapon:EmitSound("Weapon_Knife.Slash")

local trace = self.Owner:GetEyeTrace()

if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 70 then
bullet = {}
bullet.Num = 1
bullet.Src = self.Owner:GetShootPos()
bullet.Dir = self.Owner:GetAimVector()
bullet.Spread = Vector(0, 0, 0)
bullet.Tracer = 0
bullet.Force = 14
bullet.Damage = 50


self.Owner:FireBullets(bullet)
self.Weapon:EmitSound("Weapon_Knife.Slash")

if(trace.Entity:IsPlayer() or trace.Entity:IsNPC() or trace.Entity:GetClass() == "prop_ragdoll") then
self.Weapon:EmitSound(SFleshHit[math.random(1,#SFleshHit)])

else
util.Decal("ManhackCut", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)
if (trace.MatType == MAT_METAL or trace.MatType == MAT_VENT or trace.MatType == MAT_COMPUTER) then
self.Weapon:EmitSound(SMetalHit[math.random(1,#SMetalHit)])
elseif (trace.MatType == MAT_WOOD or trace.MatType == "MAT_FOLIAGE") then
self.Weapon:EmitSound(SWoodHit[math.random(1,#SWoodHit)])
elseif (trace.MatType == MAT_GLASS) then
self.Weapon:EmitSound(SGlassHit[math.random(1,#SGlassHit)])
elseif (trace.MatType == MAT_DIRT or trace.MatType == MAT_SAND or trace.MatType == MAT_SLOSH or trace.MatType == MAT_TILE or trace.MatType == MAT_PLASTIC or trace.MatType == MAT_CONCRETE) then
self.Weapon:EmitSound(SGroundHit[math.random(1,#SGroundHit)])
else
self.Weapon:EmitSound(SGroundHit[math.random(1,#SGroundHit)])
end
end

if (SERVER) then
local hitposent = ents.Create("info_target")
local trace = self.Owner:GetEyeTrace()
local hitpos = trace.HitPos
end
end
end

function SWEP:SecondaryAttack ( )
if(self.Owner:KeyDown(IN_USE)) then
self.Weapon:SetNextSecondaryFire ( CurTime ( ) + 0.5 )
local effectdata = EffectData()
effectdata:SetStart(self.Owner:GetShootPos())
effectdata:SetOrigin(self.Owner:GetShootPos())
effectdata:SetScale(1)
effectdata:SetMagnitude(1)
effectdata:SetScale(3)
effectdata:SetRadius(1)
effectdata:SetEntity(self.Owner)
for i = 1, 100 do timer.Simple(1/i, function() util.Effect("TeslaHitBoxes", effectdata, true, true) end) end
local Zap = math.random(1,9)
if Zap == 4 then Zap = 3 end
self.Owner:EmitSound("ambient/energy/zap"..Zap..".wav")

self.Owner:SetPos(self.Owner:GetEyeTrace().HitPos)

local tracedata = {}
tracedata.start = self.Owner:GetShootPos()
tracedata.endpos = tracedata.start + self.Owner:GetAimVector()*10000
tracedata.filter = self.Owner

local trace = util.TraceLine(tracedata)
local offset = Vector(0, 0, 1)
if trace.HitNormal ~= Vector(0, 0, 1) then
offset = trace.HitNormal * 16
end

-- Blood Siphon --
elseif self.mode == 0 then
self.Owner:SetAnimation ( PLAYER_ATTACK1 )
self.Weapon:SetNextPrimaryFire ( CurTime ( ) + 0.5 )
self.Weapon:SetNextPrimaryFire ( CurTime ( ) + 0.15 )
local ntrace = self.Owner:GetEyeTrace()


local effectdata = EffectData ( )
effectdata:SetOrigin ( ntrace.HitPos )
effectdata:SetScale ( 2 )
effectdata:SetColor( 255, 0, 0, 255 )
util.Effect( "WheelDust", effectdata )
if SERVER then
local ouch = ents.Create ( "point_hurt" )
ouch:SetKeyValue ( "DamageRadius", 10 )
ouch:SetKeyValue ( "Damage" , 1 )
ouch:SetKeyValue ( "DamageDelay", 0 )
ouch:SetKeyValue ( "DamageType" ,"1" )
ouch:SetPos ( ntrace.HitPos )
ouch:Fire ( "TurnOn" , "", 0 )
ouch:Fire ( "TurnOff" , "", 0.5 )
ouch:Fire ( "kill","", 0.5 )
end

elseif self.mode == 1 then ---------------------------------------------------------------------------
-- Push --
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:SetAnimation ( PLAYER_ATTACK1 )
self.Weapon:SetNextPrimaryFire ( CurTime ( ) + 0.5 )
local thetrace = self.Owner:GetEyeTrace()
local ph = thetrace.Entity:GetPhysicsObject()
if(IsValid(ph)) then
ph:ApplyForceCenter(Vector(90000,-90000,0))
thetrace.Entity:SetVelocity(self.Owner:GetForward() * 500 + Vector(0,0,-8000))
end
elseif self.mode == 2 then ---------------------------------------------------------------------------
-- Pull --
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:SetAnimation ( PLAYER_ATTACK1 )
self.Weapon:SetNextPrimaryFire ( CurTime ( ) + 0.5 )
local thetrace = self.Owner:GetEyeTrace()
local ph = thetrace.Entity:GetPhysicsObject()
if(IsValid(ph)) then
ph:ApplyForceCenter(Vector(-90000,90000,0))
thetrace.Entity:SetVelocity(self.Owner:GetForward() * -500 + Vector(0,0,-8000))
end
elseif self.mode == 3 then ---------------------------------------------------------------------------
-- Heal --
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
self.Owner:SetAnimation ( PLAYER_ATTACK1 )
self.Weapon:SetNextPrimaryFire ( CurTime ( ) + 0.5 )
local trace = self.Owner:GetEyeTrace()
local ph = trace.Entity:GetPhysicsObject()
if ( trace.Entity:IsNPC() or trace.Entity:IsPlayer() ) then
local health = trace.Entity:Health()
trace.Entity:SetHealth( health + 10 )

local effectdata = EffectData ( )
effectdata:SetOrigin ( trace.HitPos )
effectdata:SetScale ( 5 )
util.Effect( "inflator_magic", effectdata )


return end

-- Animations.
local ActIndex = {}
ActIndex["pistol"] = ACT_HL2MP_IDLE_PISTOL
ActIndex["smg"] = ACT_HL2MP_IDLE_SMG1
ActIndex["grenade"] = ACT_HL2MP_IDLE_GRENADE
ActIndex["ar2"] = ACT_HL2MP_IDLE_AR2
ActIndex["shotgun"] = ACT_HL2MP_IDLE_SHOTGUN
ActIndex["rpg"] = ACT_HL2MP_IDLE_RPG
ActIndex["physgun"] = ACT_HL2MP_IDLE_PHYSGUN
ActIndex["crossbow"] = ACT_HL2MP_IDLE_CROSSBOW
ActIndex["melee"] = ACT_HL2MP_IDLE_MELEE
ActIndex["slam"] = ACT_HL2MP_IDLE_SLAM
ActIndex["normal"] = ACT_HL2MP_IDLE
ActIndex["knife"] = ACT_HL2MP_IDLE_KNIFE
ActIndex["melee2"] = ACT_HL2MP_IDLE_MELEE2
ActIndex["passive"] = ACT_HL2MP_IDLE_PASSIVE
ActIndex["fist"] = ACT_HL2MP_IDLE_FIST

function SWEP:SetHoldType(t)

local index = ActIndex[t]

if (index == nil) then
Msg("SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set!\n")
return
end

self.ActivityTranslate = {}
self.ActivityTranslate [ ACT_MP_STAND_IDLE ] = index
self.ActivityTranslate [ ACT_MP_WALK ] = index+1
self.ActivityTranslate [ ACT_MP_RUN ] = index+2
self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = index+3
self.ActivityTranslate [ ACT_MP_CROUCHWALK ] = index+4
self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] = index+5
self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
self.ActivityTranslate [ ACT_MP_RELOAD_STAND ] = index+6
self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ] = index+6
self.ActivityTranslate [ ACT_MP_JUMP ] = index+7
self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] = index+8
if t == "normal" then
self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
end
if t == "passive" then
self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = ACT_HL2MP_CROUCH_IDLE
end
self:SetupWeaponHoldTypeForAI(t)
end

function SWEP:TranslateActivity(act)

if (self.Owner:IsNPC()) then
if (self.ActivityTranslateAI[act]) then
return self.ActivityTranslateAI[act]
end

return -1
end

if (self.ActivityTranslate[act] != nil) then
return self.ActivityTranslate[act]
end

return -1
end"VertexLitGeneric"
{
"$baseTexture" "models\weapons\v_katana\katana"
"$bumpmap" "models\weapons\v_katana\katana_normal"
"$model" "1"

}