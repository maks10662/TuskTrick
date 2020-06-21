local tusktest = {}

tusktest.option = Menu.AddOption({"Utility", "TuskTrick"}, "Enable", "Discription.")
tusktest.PressComboKey = Menu.AddKeyOption({ "Utility","TuskTrick" }, "Discription", Enum.ButtonCode.KEY_I)

function tusktest.OnUpdate()

	if Menu.IsEnabled(tusktest.option) and Menu.IsKeyDownOnce(tusktest.PressComboKey) then
		local myHero = Heroes.GetLocal()
		if not NPC.GetUnitName(myHero) == "npc_dota_hero_tusk" then return end
		local myPos = Entity.GetAbsOrigin(myHero)
		local rotation = Entity.GetAbsRotation(myHero)

		--myPos50:Normalize()
		--myPos50:SetZ(0)
		--myPos50:Scale(50)
		
		local skillShards = NPC.GetAbilityByIndex(myHero, 0)
		
		--local position = myPos-myPos50
		--position:Rotate(rotation)
		
		
		local pos = Entity.GetAbsOrigin(myHero)
		local dir = Entity.GetRotation(myHero):GetForward():Normalized()

		local pos = pos + dir:Scaled(50)
		

		
		Ability.CastPosition(skillShards, pos)
		--Log.Write(pos:__tostring())
	end

end

return tusktest