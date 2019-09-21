colorencode_updateInterval = 0.2
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

function onLoad(self)
    --hideToolTip()

    self:RegisterEvent("VARIABLES_LOADED")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("BAG_UPDATE")

    UIFrame:init()

    print("ColorEncode v" .. GetAddOnMetadata("ColorEncode", "Version") .. " loaded");
end

function onUpdate(self, elapsed)
    colorencode_sinceLastUpdate = colorencode_sinceLastUpdate + elapsed;
    if (colorencode_sinceLastUpdate > colorencode_updateInterval) then
        repaintAddon()

        colorencode_sinceLastUpdate = 0;
    end
end

function onEvent(self, event, ...)
    if (event == "VARIABLES_LOADED") then
        onVariablesLoaded()
    end

    if (event == "ZONE_CHANGED_NEW_AREA") then
        zoneChanged()
    end

    if (event == "BAG_UPDATE") then
        bagUpdate()
    end
end

function onVariablesLoaded()
    if colorencode_config == nil then
        colorencode_config = colorencode_standart_config
    end

    UIFrame:configure(colorencode_config.mainframe)
end

function bagUpdate()
    UIFrame:bagUpdated()
end

function zoneChanged()
--    SetMapToCurrentZone();
end

function showToolTip(tooltip)
    --local itemName = GameTooltipTextLeft1:GetText()
    --
    --isHerbColor = buildBoolean(false)
    --isOreColor = buildBoolean(false)
    --
    --if (isOre(itemName)) then
    --    isOreColor = buildBoolean(true)
    --elseif (isHerb(itemName)) then
    --    isHerbColor = buildBoolean(true)
    --end
    --
    --ColorEncodeMainFrame_isHerb:SetTextureColor(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
    --ColorEncodeMainFrame_isOre:SetTextureColor(isOreColor.red, isOreColor.green, isOreColor.blue)
    --
    --C_Timer.After(1, function()
    --    isHerbColor = buildBoolean(false)
    --    isOreColor = buildBoolean(false)
    --
    --    ColorEncodeMainFrame_isHerb:SetTextureColor(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
    --    ColorEncodeMainFrame_isOre:SetTextureColor(isOreColor.red, isOreColor.green, isOreColor.blue)
    --
    --    tooltip:Hide()
    --end)
end

function hideToolTip(tooltip)
    --isOreColor = buildBoolean(false)
    --isHerbColor = buildBoolean(false)
    --
    --ColorEncodeMainFrame_isHerb:SetTextureColor(isHerbColor.red, isHerbColor.green, isHerbColor.blue)
    --ColorEncodeMainFrame_isOre:SetTextureColor(isOreColor.red, isOreColor.green, isOreColor.blue)
end

function repaintAddon()
    playerStatus = WoW:getPlayerStatus()
    UIFrame:setX(playerStatus.x)
    UIFrame:setY(playerStatus.y)
    UIFrame:setPitch(playerStatus.pitch)
    UIFrame:setAzimuth(playerStatus.azimuth)
    UIFrame:setInCombat(playerStatus.isInCombat)
    UIFrame:setHasTarget(playerStatus.hasTarget)
    UIFrame:setIsInActionRange(playerStatus.isInActionRange)
end

GameTooltip:HookScript('OnShow', showToolTip)
GameTooltip:HookScript('OnHide', hideToolTip)
