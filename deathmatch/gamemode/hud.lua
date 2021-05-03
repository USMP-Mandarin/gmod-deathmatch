

function Hud()
	local client = LocalPlayer()

	if ( !client:Alive() ) then
		return
	end

	draw.RoundedBox(0, 0, ScrH() - 100, 250, 100, Color(30, 30, 30, 230))

	draw.SimpleText("HP: "..client:Health().."%", "DermaDefaultBold", 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0)

	draw.RoundedBox(0, 10, ScrH() - 75, 100 * 2.25, 15, Color(255, 0, 0, 30))
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 15, Color(255, 0, 0, 230))



	draw.SimpleText("Armor: "..client:Armor().."%", "DermaDefaultBold", 10, ScrH() - 55, Color(255, 255, 255, 255), 0, 0)

	draw.RoundedBox(0, 10, ScrH() - 35, 100 * 2.25, 15, Color(0, 0, 225, 225))
	draw.RoundedBox(0, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.25, 15, Color(0, 0, 225, 230))



	draw.RoundedBox(0, 255, ScrH() - 70, 125, 70, Color(30, 30, 30, 230))

	if ( client:GetActiveWeapon():GetPrintName() != nil ) then
		draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", 260, ScrH() - 60, Color(255, 255, 255, 255), 0, 0)
	end

	if ( client:GetActiveWeapon():Clip1() != -1) then
		draw.SimpleText("Ammo: "..client:GetActiveWeapon():Clip1().."/"..client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
	end

end
hook.Add("HUDPaint", "TestHud", Hud)

function HideHud(name)
	for k,v in pairs( {"CHudHealth", "CHudHealth", "CHudAmmo", "CHudSecondaryAmmo"} ) do
		if name == v then
			return false
		end
	end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)