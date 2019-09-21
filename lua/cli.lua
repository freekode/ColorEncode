SLASH_COLORENCODE1 = '/colorenc';
SlashCmdList['COLORENCODE'] = function(msg, editbox)
    args = {}
    index = 0
    for elem in string.gmatch(msg, '%S+') do
        args[index] = elem
        index = index + 1
    end

    if args[0] == 'show' then
        MainFrame:Show()
    elseif args[0] == 'hide' then
        MainFrame:Hide()
    elseif args[0] == 'info' then
        printCoordinates()
    elseif args[0] == 'set' then
        config = {}
        for i = 1, table.getn(args) do
            name, value = args[i]:match("([^,]+)=([^,]+)")

            config[name] = value
        end

        setConfig(config)
    elseif args[0] == 'default' then
        setConfigDefault()
    elseif args[0] == 'help' then
        printHelp()
    else
        printHelp()
    end
end

function printHelp()
    print('|cFF00FF00 /colorenc [info show hide help]|r')
end

function printCoordinates()
    playerStatus = WoW:getPlayerStatus()

    x = string.format('%.6f', playerStatus.x)
    y = string.format('%.6f', playerStatus.y)
    pitch = string.format('%.3f', playerStatus.pitch)
    azimuth = string.format('%.5f', playerStatus.azimuth)

    print('Information:\n' ..
            'x=[|cFFFF0066' .. x .. '|r]; y=[|cFFFF6600' .. y .. '|r];\n' ..
            'pitch=[|cFF9933FF' .. pitch .. '|r]; azimyth=[|cFF0099FF' .. azimuth .. '|r];\n' ..
            'isInCombat=[' .. tostring(playerStatus.isInCombat) .. ']')
end

function setConfig(config)
    for k, v in pairs(config) do
        colorencode_config.mainframe[k] = config[k]

        print(k .. '=' .. config[k])
    end

    configureMainFrame(colorencode_config.mainframe)
end

function setConfigDefault()
    colorencode_config = colorencode_standart_config

    configureMainFrame(colorencode_config.mainframe)
end
