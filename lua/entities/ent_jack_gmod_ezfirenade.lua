﻿-- Jackarunda 2021
AddCSLuaFile()
ENT.Base = "ent_jack_gmod_ezgrenade"
ENT.Author = "Jackarunda, TheOnly8Z"
ENT.Category = "JMod - EZ Explosives"
ENT.PrintName = "EZ Incendiary Grenade"
ENT.Spawnable = true
ENT.Model = "models/jmod/explosives/grenades/firenade/incendiary_grenade.mdl"
--ENT.ModelScale=1.5
ENT.SpoonModel = "models/jmod/explosives/grenades/firenade/incendiary_grenade_spoon.mdl"
ENT.PinBodygroup = {3, 1}
ENT.SpoonBodygroup = {2, 1}
ENT.DetDelay = 4

if SERVER then
	function ENT:Detonate()
		if self.Exploded then return end
		self.Exploded = true
		local SelfPos, Owner, SelfVel = self:LocalToWorld(self:OBBCenter()), self.EZowner or self, self:GetPhysicsObject():GetVelocity()
		local Boom = ents.Create("env_explosion")
		Boom:SetPos(SelfPos)
		Boom:SetKeyValue("imagnitude", "50")
		Boom:SetOwner(Owner)
		Boom:Spawn()
		Boom:Fire("explode", 0)

		for i = 1, 25 do
			local FireVec = (self:GetVelocity() / 500 + VectorRand() * .3 + Vector(0, 0, .3)):GetNormalized()
			FireVec.z = FireVec.z / 2
			local Flame = ents.Create("ent_jack_gmod_eznapalm")
			Flame:SetPos(SelfPos + Vector(0, 0, 10))
			Flame:SetAngles(FireVec:Angle())
			Flame:SetOwner(JMod.GetEZowner(self))
			JMod.SetEZowner(Flame, self.EZowner or self)
			Flame.SpeedMul = self:GetVelocity():Length() / 1000 + .5
			Flame.Creator = self
			Flame.HighVisuals = true
			Flame:Spawn()
			Flame:Activate()
		end

		self:Remove()
	end
elseif CLIENT then
	language.Add("ent_jack_gmod_ezfirenade", "EZ Incendiary Grenade")
end
