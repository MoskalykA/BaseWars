function GM:PlayerInitialSpawn(ply, transiton)
    player_manager.SetPlayerClass(ply, 'player_sandbox')
	self.Sandbox.PlayerSpawn(self, ply, transiton)

    Cray_Basewars.Data:SyncDataFile(ply)

    local data = Cray_Basewars.Data:GetDataFile(ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Money', data.money, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Level', data.level, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Exp', data.exp, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Prestige', data.prestige, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Faction', data.faction, ply)
end

function GM:PlayerSpawn(ply, transiton)
    player_manager.SetPlayerClass(ply, 'player_sandbox')
	self.Sandbox.PlayerSpawn(self, ply, transiton)

    Cray_Basewars.Data:SyncDataFile(ply)

    local data = Cray_Basewars.Data:GetDataFile(ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Money', data.money, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Level', data.level, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Exp', data.exp, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Prestige', data.prestige, ply)
    Cray_Lib.Data:SetData('Cray_Basewars.Data.Faction', data.faction, ply)
end

function GM:ShowHelp(ply)
    net.Start('Cray_Basewars.Nets.OpenFaction')
        net.WriteTable(Cray_Basewars.Data:GetDataFile(ply))
    net.Send(ply)
end