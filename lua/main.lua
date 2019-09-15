colorencode_updateInterval = 0.1
colorencode_sinceLastUpdate = 0
colorencode_standart_config = {
    mainframe = {
        point = 'TOPLEFT',
        relativeFrame = 'UIParent',
        relativePoint = 'TOPLEFT',
        offsetX = 0,
        offsetY = 0,
        sidePx = 10
    }
}


function onload(self)
    print("ColorEncode v" .. GetAddOnMetadata("ColorEncode", "Version") .. " loaded");

    hideToolTip()

    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("BAG_UPDATE")
end


function onupdate(self, elapsed)
    colorencode_sinceLastUpdate = colorencode_sinceLastUpdate + elapsed;  
    if (colorencode_sinceLastUpdate > colorencode_updateInterval) then
        repaintAddon()

        colorencode_sinceLastUpdate = 0;
    end
end


function onevent(self, event, ...)
    if (event == "VARIABLES_LOADED") then
        variablesLoaded()
    end

    if (event == "ZONE_CHANGED_NEW_AREA") then
        zoneChanged()
    end

    if (event == "BAG_UPDATE") then
        bagUpdate()
    end
end


function variablesLoaded()
    if colorencode_config == nil then
        colorencode_config = colorencode_standart_config
    end

    configureMainFrame(colorencode_config.mainframe)
end


function configureMainFrame(config)
    ColorEncodeMainFrame:SetPoint(config.point, config.relativeFrame, config.relativePoint, config.offsetX, config.offsetY)
end


function bagUpdate()
	bagUpdateColor = buildBoolean(true)
    
    ColorEncodeMainFrame_bagUpdated:SetTexture(bagUpdateColor.red, bagUpdateColor.green, bagUpdateColor.blue)

    C_Timer.After(2, function()
        bagUpdateColor = buildBoolean(false)
        ColorEncodeMainFrame_bagUpdated:SetTexture(bagUpdateColor.red, bagUpdateColor.green, bagUpdateColor.blue)
    end)
end


function zoneChanged()
    SetMapToCurrentZone();
end


function showToolTip(tooltip)
    local itemName = GameTooltipTextLeft1:GetText()

    isHerbColor = buildBoolean(false)
    isOreColor = buildBoolean(false)

    if (isOre(itemName)) then
        isOreColor = buildBoolean(true)
    elseif (isHerb(itemName)) then
        isHerbColor = buildBoolean(true)
    end

    ColorEncodeMainFrame_isHerb:SetTexture(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
    ColorEncodeMainFrame_isOre:SetTexture(isOreColor.red, isOreColor.green, isOreColor.blue)

    C_Timer.After(1, function()
        isHerbColor = buildBoolean(false)
        isOreColor = buildBoolean(false)

        ColorEncodeMainFrame_isHerb:SetTexture(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
        ColorEncodeMainFrame_isOre:SetTexture(isOreColor.red, isOreColor.green, isOreColor.blue)

        tooltip:Hide()
    end)
end


function hideToolTip(tooltip)
    isOreColor = buildBoolean(false)
    isHerbColor = buildBoolean(false)

    ColorEncodeMainFrame_isHerb:SetTexture(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
    ColorEncodeMainFrame_isOre:SetTexture(isOreColor.red, isOreColor.green, isOreColor.blue)
end


function repaintAddon()
    local x, y = GetPlayerMapPosition("player")
    local pitch = GetUnitPitch("player")
    local azimyth = GetPlayerFacing()
    local isInCombat = UnitAffectingCombat("player")
    local hasTarget = UnitExists("target")
    local inActionRange = IsActionInRange(1)

    if (x > 0 and x < 100) then
        xColor = buildCoordinates(x)
    else
        xColor = buildBoolean(false)
    end

    if (y > 0 and y < 100) then
        yColor = buildCoordinates(y)
    else
        yColor = buildBoolean(false)
    end
    
    if (pitch == 0) then
        pitchColor = buildBoolean(false)
    else
        pitchColor = buildPitch(pitch)
    end

    azimythColor = buildAzimyth(azimyth)
    isInCombatColor = buildBoolean(isInCombat)
    hasTargetColor = buildBoolean(hasTarget)
    inActionRangeColor = buildBoolean(inActionRange)


    ColorEncodeMainFrame_xTex:SetTexture(xColor.red, xColor.green, xColor.blue);
    ColorEncodeMainFrame_yTex:SetTexture(yColor.red, yColor.green, yColor.blue);
    ColorEncodeMainFrame_pitchTex:SetTexture(pitchColor.red, pitchColor.green, pitchColor.blue);
    ColorEncodeMainFrame_azimythTex:SetTexture(azimythColor.red, azimythColor.green, azimythColor.blue);
    ColorEncodeMainFrame_isInCombatTex:SetTexture(isInCombatColor.red, isInCombatColor.green, isInCombatColor.blue);
    ColorEncodeMainFrame_hasTargetTex:SetTexture(hasTargetColor.red, hasTargetColor.green, hasTargetColor.blue);
    ColorEncodeMainFrame_inActionRangeTex:SetTexture(inActionRangeColor.red, inActionRangeColor.green, inActionRangeColor.blue);
end


GameTooltip:HookScript('OnShow', showToolTip)
GameTooltip:HookScript('OnHide', hideToolTip)
