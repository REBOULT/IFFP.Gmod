IFPPMenu = {}
IFPPMenu.PanelB = nil

function IFPPMenu.PanelA(panel)
	panel:ClearControls()
	
	panel:AddControl("Label", {Text = "Main control"})
	panel:AddControl("CheckBox", {Label = "IFPP: Status", Command = "iv_status"})
	
	local slider = vgui.Create("DNumSlider", panel)
	slider:SetDecimals(2)
	slider:SetMin(0.2)
	slider:SetMax(0.6)
	slider:SetConVar("iv_viewsmooth")
	slider:SetValue(GetConVarNumber("iv_viewsmooth"))
	slider:SetText("IFPP: View smooth (percentage)")
	
	panel:AddItem(slider)
	
	panel:AddControl("CheckBox", {Label = "CROSSHAIR: Status", Command = "iv_crosshair"})
	panel:AddControl("Label", {Text = "CROSSHAIR: Outline color"})
	panel:AddControl("Color", {Label = "CROSSHAIR: Outline color", Red = "iv_out_r", Green = "iv_out_g", Blue = "iv_out_b", Alpha = "iv_out_a", ShowAlpha = false, ShowHSV = true, ShowRGB = true, NumberMultiplier = "1"})
	panel:AddControl("Label", {Text = "CROSSHAIR: Inline color"})
	panel:AddControl("Color", {Label = "CROSSHAIR: Inline color", Red = "iv_in_r", Green = "iv_in_g", Blue = "iv_in_b", Alpha = "iv_in_a", ShowAlpha = false, ShowHSV = true, ShowRGB = true, NumberMultiplier = "1"})
end

function IFPPMenu.OpenSpawnMenu()
	if(IFPPMenu.PanelB) then
		IFPPMenu.PanelA(IFPPMenu.PanelB)
	end
end
hook.Add("SpawnMenuOpen", "IFPPMenu.OpenSpawnMenu", IFPPMenu.OpenSpawnMenu)

function IFPPMenu.PopulateAdminMenu()
	spawnmenu.AddToolMenuOption("Utilities", "IFPP", "IFPP", "Client", "", "", IFPPMenu.PanelA)
end
hook.Add("PopulateToolMenu", "IFPPMenu.PopulateAdminMenu", IFPPMenu.PopulateAdminMenu)