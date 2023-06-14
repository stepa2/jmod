﻿-- Jackarunda 2021
AddCSLuaFile()
ENT.Base = "ent_jack_gmod_ezresource"
ENT.PrintName = "EZ Concrete"
ENT.Category = "JMod - EZ Resources"
ENT.IconOverride = "materials/ez_resource_icons/concrete.png"
ENT.Spawnable = true
ENT.AdminSpawnable = true
---
ENT.EZsupplies = JMod.EZ_RESOURCE_TYPES.CONCRETE
ENT.JModPreferredCarryAngles = Angle(0, 0, 0)
ENT.Model = "models/hunter/blocks/cube05x05x05.mdl"
ENT.Material = "models/mat_jack_gmod_aluminumore"
ENT.ModelScale = 1
ENT.Mass = 50
ENT.ImpactNoise1 = "Rock.ImpactHard"
ENT.DamageThreshold = 200
ENT.BreakNoise = "Boulder.ImpactHard"

if CLIENT then
	function ENT:Draw()
		self:DrawModel()

		JMod.HoloGraphicDisplay(self, Vector(0, -12, 1), Angle(90, 0, 90), .04, 300, function()
			JMod.StandardResourceDisplay(JMod.EZ_RESOURCE_TYPES.CONCRETE, self:GetResource(), nil, 0, 0, 200, true)
		end)
	end

	language.Add(ENT.ClassName, ENT.PrintName)
end