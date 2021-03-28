function Cray_Basewars.Data:SyncDataFile(ply)
    if ply and IsValid(ply) and ply:IsPlayer() then 
        if not file.Exists('cray_basewars/', 'DATA') then
            file.CreateDir('cray_basewars')
            file.CreateDir('cray_basewars/player')
            file.Write('cray_basewars/player/' .. ply:SteamID64() .. '.json', util.TableToJSON(Cray_Basewars.Data.PlayerBase))
        end

        if not file.Exists('cray_basewars/player/', 'DATA') then
            file.CreateDir('cray_basewars/player')
            file.Write('cray_basewars/player/' .. ply:SteamID64() .. '.json', util.TableToJSON(Cray_Basewars.Data.PlayerBase))
        end

        if not file.Exists('cray_basewars/player/' .. ply:SteamID64() .. '.json', 'DATA') then
            file.Write('cray_basewars/player/' .. ply:SteamID64() .. '.json', util.TableToJSON(Cray_Basewars.Data.PlayerBase))
        end
    else
        if not file.Exists('cray_basewars/', 'DATA') then
            file.CreateDir('cray_basewars')
            file.CreateDir('cray_basewars/player')
        end

        if not file.Exists('cray_basewars/player/', 'DATA') then
            file.CreateDir('cray_basewars/player')
        end
    end
end

function Cray_Basewars.Data:GetDataFile(ply)
    if ply and IsValid(ply) and ply:IsPlayer() then 
        Cray_Basewars.Data:SyncDataFile(ply)

        return util.JSONToTable(file.Read('cray_basewars/player/' .. ply:SteamID64() .. '.json', 'DATA'))
    end
end