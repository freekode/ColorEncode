WoW = {}

function WoW:getPlayerStatus()
    local map = C_Map.GetBestMapForUnit("player")
    local x, y = C_Map.GetPlayerMapPosition(map, "player"):GetXY()
    --local pitch = GetUnitPitch("player")
    local pitch = 0
    local azimuth = GetPlayerFacing()
    local isInCombat = UnitAffectingCombat("player")
    local hasTarget = UnitExists("target")
    local isInActionRange = IsActionInRange(1)

    return PlayerStatus:new(nil, x, y, pitch, azimuth, isInCombat, hasTarget, isInActionRange)
end
