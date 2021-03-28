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
            frame:SetSize(400, 530)
            frame:Center()
            frame:MakePopup()
            frame:SetTitle('Cray Basewars')

            local label = vgui.Create('DLabel', frame)
            label:Dock(TOP)
            label:SetText('- ' .. Cray_Basewars.Language[country].name_of_the_faction)
            label:SetFont(Cray_Lib.Fonts:Font(8))
            label:SizeToContents()

            local text = vgui.Create('Cray_Text', frame)
            text:Dock(TOP)
            text:DockMargin(0, 5, 0, 0)

            local label2 = vgui.Create('DLabel', frame)
            label2:Dock(TOP)
            label2:DockMargin(0, 15, 0, 0)
            label2:SetText('- ' .. Cray_Basewars.Language[country].description_of_the_faction)
            label2:SetFont(Cray_Lib.Fonts:Font(8))
            label2:SizeToContents()

            local text2 = vgui.Create('Cray_Text', frame)
            text2:SetTall(80)
            text2:SetMultiline(true)
            text2:Dock(TOP)
            text2:DockMargin(0, 5, 0, 0)

            local label3 = vgui.Create('DLabel', frame)
            label3:Dock(TOP)
            label3:DockMargin(0, 20, 0, 0)
            label3:SetText('- ' .. Cray_Basewars.Language[country].discord_of_the_faction)
            label3:SetFont(Cray_Lib.Fonts:Font(8))
            label3:SizeToContents()

            local text3 = vgui.Create('Cray_Text', frame)
            text3:Dock(TOP)
            text3:DockMargin(0, 5, 0, 0)

            local label4 = vgui.Create('DLabel', frame)
            label4:Dock(TOP)
            label4:DockMargin(0, 20, 0, 0)
            label4:SetText('- ' .. Cray_Basewars.Language[country].logo_of_the_faction)
            label4:SetFont(Cray_Lib.Fonts:Font(8))
            label4:SizeToContents()

            local text4 = vgui.Create('Cray_Text', frame)
            text4:Dock(TOP)
            text4:DockMargin(0, 5, 0, 0)

            local label5 = vgui.Create('DLabel', frame)
            label5:Dock(TOP)
            label5:DockMargin(0, 20, 0, 0)
            label5:SetText('- ' .. Cray_Basewars.Language[country].password_of_the_faction)
            label5:SetFont(Cray_Lib.Fonts:Font(8))
            label5:SizeToContents()

            local text5 = vgui.Create('Cray_Text', frame)
            text5:Dock(TOP)
            text5:DockMargin(0, 5, 0, 0)

            local status = vgui.Create('DLabel', frame)
            status:Dock(TOP)
            status:DockMargin(0, 10, 0, 0)
            status:SetText('- ' .. Cray_Basewars.Language[country].no_error)
            status:SetTextColor(Cray_Lib.Colors:Color(39, 174, 96))
            status:SetFont(Cray_Lib.Fonts:Font(8))
            status:SizeToContents()

            local button = vgui.Create('Cray_Button', frame)
            button:Dock(TOP)
            button:DockMargin(0, 15, 0, 0)
            button:SetText(Cray_Basewars.Language[country].create_faction)
            button.DoClick = function()
                if text:GetValue() == '' then
                    status:SetText('- ' .. Cray_Basewars.Language[country].fill_all_fields)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif text2:GetValue() == '' then
                    status:SetText('- ' .. Cray_Basewars.Language[country].fill_all_fields)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif text3:GetValue() == '' then
                    status:SetText('- ' .. Cray_Basewars.Language[country].fill_all_fields)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif text4:GetValue() == '' then
                    status:SetText('- ' .. Cray_Basewars.Language[country].fill_all_fields)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif text5:GetValue() == '' then
                    status:SetText('- ' .. Cray_Basewars.Language[country].fill_all_fields)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif string.len(text2:GetValue()) < 30 then
                    status:SetText('- ' .. Cray_Basewars.Language[country].description_30)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif string.len(text3:GetValue()) < 11 then
                    status:SetText('- ' .. Cray_Basewars.Language[country].discord_11)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                elseif string.len(text4:GetValue()) < 7 then
                    status:SetText('- ' .. Cray_Basewars.Language[country].logo_7)
                    status:SetTextColor(Cray_Lib.Colors:Color(192, 57, 43))
                else
                    status:SetText('- ' .. Cray_Basewars.Language[country].no_error)
                    status:SetTextColor(Cray_Lib.Colors:Color(39, 174, 96))

                    frame:Close()

                    local table_information = {
                        name = text:GetValue(),
                        description = text2:GetValue(),
                        discord = text3:GetValue(),
                        logo = text4:GetValue(),
                        password = text5:GetValue()
                    }
                    net.Start('Cray_Basewars.Nets.CreateFaction')
                        net.WriteTable(table_information)
                    net.SendToServer()
                end
            end
        end
    end
end)