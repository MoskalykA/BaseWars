local noDraw = {
    ['CHudHealth'] = true,
    ['CHudBattery'] = true,
    ['CHudSuitPower'] = true,
    ['CHUDQuickInfo'] = true
}
function GM:HUDShouldDraw(name)
    if noDraw[name] or (HelpToggled and name == 'CHudChat') then
        return false
    else
        return self.Sandbox.HUDShouldDraw(self, name)
    end
end

function GM:HUDDrawTargetID()
    return false
end

function GM:HUDPaint()
    draw.SimpleText(Cray_Lib.Math:MoneyCommas(Cray_Lib.Data:GetData('Cray_Basewars.Data.Money', LocalPlayer())) .. ' | ', Cray_Lib.Fonts:Font(8), 10, 0, color_white)
    draw.SimpleText('Level ' .. Cray_Lib.Data:GetData('Cray_Basewars.Data.Level', LocalPlayer()) .. ' | ', Cray_Lib.Fonts:Font(8), 90, 0, color_white)
    draw.SimpleText(Cray_Lib.Data:GetData('Cray_Basewars.Data.Exp', LocalPlayer()) .. ' EXP | ', Cray_Lib.Fonts:Font(8), 170, 0, color_white)
    draw.SimpleText(Cray_Lib.Data:GetData('Cray_Basewars.Data.Prestige', LocalPlayer()) .. ' Prestige | ', Cray_Lib.Fonts:Font(8), 240, 0, color_white)
    draw.SimpleText('Faction - ' .. Cray_Lib.Data:GetData('Cray_Basewars.Data.Faction', LocalPlayer()), Cray_Lib.Fonts:Font(8), 350, 0, color_white)
    
    self.Sandbox.HUDPaint(self)
end

local scoreboard
function GM:ScoreboardShow()
    scoreboard = vgui.Create('Cray_Frame')
    scoreboard:SetSize(800, 1000)
    scoreboard:Center()
    scoreboard:MakePopup()
    scoreboard:SetTitle('Cray Basewars')
    scoreboard:ShowCloseButton(false)

    local scroll_panel = vgui.Create('DScrollPanel', scoreboard)
    scroll_panel:Dock(FILL)
    scroll_panel:SetCursor('blank')
    scroll_panel.Paint = function(self, w, h)
        Cray_Lib.Graphics:DrawCustomCursor(self, Cray_Lib.Materials:Material('cray_lib/cursor.png'))
    end

    local country = system.GetCountry()
    for k, v in ipairs(player.GetAll()) do
        local player_panel = scroll_panel:Add('Cray_Panel')
        player_panel:SetSize(800, 70)
        player_panel:Dock(TOP)
	    player_panel:DockMargin(0, 3, 0, 5)

        local player_avatar = vgui.Create('Cray_Avatar', player_panel)
        player_avatar:SetSize(64, 64)
        player_avatar:SetPos(8, 3)
        player_avatar:SetPlayer(v, 64)

        local player_name = vgui.Create('DLabel', player_panel)
        player_name:SetPos(85, 17.5)
        player_name:SetText(v:Name() .. ' - ' .. Cray_Lib.Data:GetData('Cray_Basewars.Data.Faction', v))
        player_name:SetFont(Cray_Lib.Fonts:Font(8))
        player_name:SizeToContents()

        local player_ping = vgui.Create('DLabel', player_panel)
        player_ping:SetPos(685, 17.5)
        player_ping:SetText(Cray_Basewars.Language[country].latency .. v:Ping())
        player_ping:SetFont(Cray_Lib.Fonts:Font(8))
        player_ping:SizeToContents()
    end
end

function GM:ScoreboardHide()
    if IsValid(scoreboard) then
        scoreboard:Close()
    end
end