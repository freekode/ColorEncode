PlayerStatus = {
    x = 0,
    y = 0,
    pitch = 0,
    azimuth = 0,
    isInCombat = false,
    hasTarget = false,
    isInActionRange = false
}

function PlayerStatus:new (o, x, y, pitch, azimuth, isInCombat, hasTarget, isInActionRange)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    self.x = x
    self.y = y
    self.pitch = pitch
    self.azimuth = azimuth
    self.isInCombat = isInCombat
    self.hasTarget = hasTarget
    self.isInActionRange = isInActionRange

    if (x < 0 or x > 100) then
        x = 0
    end

    if (y < 0 or y > 100) then
        y = 0
    end

    return o
end

