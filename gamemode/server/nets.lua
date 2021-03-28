util.AddNetworkString('Cray_Basewars.Nets.OpenFaction')
util.AddNetworkString('Cray_Basewars.Nets.CreateFaction')

net.Receive('Cray_Basewars.Nets.CreateFaction', function(len, ply)
    if not IsValid(ply) then return end
    if not ply:Alive() then return end

    Cray_Basewars.Data:SyncDataFile(ply)

    if Cray_Basewars.Data:GetDataFile(ply).faction == '' then 
        local table_information = net.ReadTable()
        local files, directory = file.Find('cray_basewars/faction/*', 'DATA')
        if files[1] == nil then
            file.Write('cray_basewars/faction/' .. table_information.name .. '.json', util.TableToJSON(table_information))

            local table_player = util.JSONToTable(file.Read('cray_basewars/player/' .. ply:SteamID64() .. '.json', 'DATA'))
            table_player.faction = table_information.name
            file.Write('cray_basewars/player/' .. ply:SteamID64() .. '.json', util.TableToJSON(table_player))

            Cray_Lib.Data:SetData('Cray_Basewars.Data.Faction', table_information.name, ply)
        else
            for k, v in ipairs(files) do
                if string.Replace(v, '.json', '') == table_information.name then
                    net.Start('Cray_Lib.Nets.Notification.Send')
                        net.WriteString(Cray_Basewars.Language[country or 'FR'].faction_has_already_name)
                        net.WriteInt(1, 8)
                        net.WriteInt(10, 8)
                    net.Send(ply)
                else
                    file.Write('cray_basewars/faction/' .. table_information.name .. '.json', util.TableToJSON(table_information))
    
                    local table_player = util.JSONToTable(file.Read('cray_basewars/player/' .. ply:SteamID64() .. '.json', 'DATA'))
                    table_player.faction = table_information.name
                    file.Write('cray_basewars/player/' .. ply:SteamID64() .. '.json', util.TableToJSON(table_player))
    
                    Cray_Lib.Data:SetData('Cray_Basewars.Data.Faction', table_information.name, ply)
                end
            end
        end
    end
end)