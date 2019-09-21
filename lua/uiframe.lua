UIFrame = {}

function UIFrame:configure(config)
    ColorEncodeMainFrame:SetPoint(config.point, config.relativeFrame, config.relativePoint, config.offsetX, config.offsetY)
end

function UIFrame:init()
    color = ColorLib:getBooleanColor(true)
    ColorEncodeMainFrame_xTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_yTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_pitchTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_azimuthTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_isInCombatTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_hasTargetTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_isInActionRangeTex:SetColorTexture(color.red, color.green, color.blue);
    ColorEncodeMainFrame_bagUpdated:SetColorTexture(color.red, color.green, color.blue)
    ColorEncodeMainFrame_isHerb:SetColorTexture(color.red, color.green, color.blue)
    ColorEncodeMainFrame_isOre:SetColorTexture(color.red, color.green, color.blue)
end

function UIFrame:setX(value)
    color = ColorLib:getCoordinatesColor(value)
    ColorEncodeMainFrame_xTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setY(value)
    color = ColorLib:getCoordinatesColor(value)
    ColorEncodeMainFrame_yTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setPitch(value)
    color = ColorLib:getPitchColor(value)
    ColorEncodeMainFrame_pitchTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setAzimuth(value)
    color = ColorLib:getAzimuthColor(value)
    ColorEncodeMainFrame_azimuthTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setInCombat(value)
    color = ColorLib:getBooleanColor(value)
    ColorEncodeMainFrame_isInCombatTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setHasTarget(value)
    color = ColorLib:getBooleanColor(value)
    ColorEncodeMainFrame_hasTargetTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:setIsInActionRange(value)
    color = ColorLib:getBooleanColor(value)
    ColorEncodeMainFrame_isInActionRangeTex:SetColorTexture(color.red, color.green, color.blue);
end

function UIFrame:bagUpdated()
    color = ColorLib:getBooleanColor(true)
    ColorEncodeMainFrame_bagUpdated:SetColorTexture(color.red, color.green, color.blue)

    C_Timer.After(2, function()
        color = ColorLib:getBooleanColor(false)
        ColorEncodeMainFrame_bagUpdated:SetTexture(color.red, color.green, color.blue)
    end)
end
