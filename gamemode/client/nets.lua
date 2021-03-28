net.Receive('Cray_Basewars.Nets.OpenFaction', function()
    local table_player = net.ReadTable()
    local country = system.GetCountry()
    if table_player.faction == '' then
        local frame = vgui.Create('Cray_Frame')
        frame:SetSize(200, 200)
        frame:Center()
        frame:MakePopup()
        frame:SetTitle('Cray Basewars')

        local button = vgui.Create('Cray_Button', frame)
        button:SetPos(25, 40)
        button:SetSize(150, 150)
        button:SetText(Cray_Basewars.Language[country].create_faction)
        button.DoClick = function()
            frame:Close()

            local frame = vgui.Create('Cray_Frame')
            frame:SetSize(400, 600)
            frame:Center()
            frame:MakePopup()
            frame:SetTitle('Cray Basewars')

            local label = vgui.Create('DLabel', frame)
            label:Dock(TOP)
            label:SetText('- ' .. Cray_Basewars.Language[country].name_of_the_faction)
            label:SetFont(Cray_Lib.Fonts:Font(8))
            label:SizeToContents()

            local text = vgui.Create('DTextEntry', frame)
            text:Dock(TOP)
            text:DockMargin(0, 5, 0, 0)

            local label2 = vgui.Create('DLabel', frame)
            label2:Dock(TOP)
            label2:DockMargin(0, 15, 0, 0)
            label2:SetText('- ' .. Cray_Basewars.Language[country].description_of_the_faction)
            label2:SetFont(Cray_Lib.Fonts:Font(8))
            label2:SizeToContents()

            local text2 = vgui.Create('DTextEntry', frame)
            text2:Dock(TOP)
            text2:DockMargin(0, 5, 0, 0)
            text2:SetMultiline(true)
        end
    end
end)