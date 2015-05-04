colorencode_updateInterval = 1.0
colorencode_sinceLastUpdate = 1.0


function onload(self)
    print("ColorEncode v" .. GetAddOnMetadata("ColorEncode", "Version") .. " loaded");
end


function onupdate(self, elapsed)
    colorencode_sinceLastUpdate = colorencode_sinceLastUpdate + elapsed;  
    if (colorencode_sinceLastUpdate > colorencode_updateInterval) then
        -- CODE
        repaintByCoord()

        colorencode_sinceLastUpdate = 0;
    end
end


function repaintByCoord()
    SetMapToCurrentZone();

    local x, y = GetPlayerMapPosition("player")
    local pitch = GetUnitPitch("player")
    local azimyth = GetPlayerFacing()

    xColor = buildCoordinates(x)
    yColor = buildCoordinates(y)

    pitchColor = buildPitch(pitch)
    azimythColor = buildAzimyth(azimyth)


    xTex:SetTexture(xColor.red, xColor.green, xColor.blue);
    yTex:SetTexture(yColor.red, yColor.green, yColor.blue);
    pitchTex:SetTexture(pitchColor.red, pitchColor.green, pitchColor.blue);
    azimythTex:SetTexture(azimythColor.red, azimythColor.green, azimythColor.blue);
end
