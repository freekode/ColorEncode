ColorLib = {}

-- 55.3645
function ColorLib:getCoordinatesColor(number)
    local rgb = { red = 0, green = 0, blue = 0 }

    if number == 0 then
        return rgb
    end

    rgb.red = tonumber(string.sub(number, 3, 4)) / 100
    rgb.green = tonumber(string.sub(number, 5, 6)) / 100
    rgb.blue = tonumber(string.sub(number, 7, 8)) / 100

    return rgb
end

-- -1.468
function ColorLib:getPitchColor(number)
    local rgb = { red = 0, green = 0, blue = 0 }

    if number == 0 then
        return rgb
    end

    number = number / 10
    if number < 0 then
        rgb.red = 1
        number = number * -1
    else
        rgb.red = 0
    end

    rgb.green = tonumber(string.sub(number, 3, 4)) / 100
    rgb.blue = tonumber(string.sub(number, 5, 6)) / 100

    return rgb
end

-- 3.05104
function ColorLib:getAzimuthColor(number)
    local rgb = { red = 0, green = 0, blue = 0 }

    if number == 0 then
        return rgb
    end

    number = number / 10

    rgb.red = tonumber(string.sub(number, 3, 4)) / 100
    rgb.green = tonumber(string.sub(number, 5, 6)) / 100
    rgb.blue = tonumber(string.sub(number, 7, 8)) / 100

    return rgb
end

-- true\false
function ColorLib:getBooleanColor(status)
    local rgb = { red = 0, green = 0, blue = 0 }

    if status == true then
        rgb.red = 1
        rgb.green = 1
        rgb.blue = 1
    else
        rgb.red = 0
        rgb.green = 0
        rgb.blue = 0
    end

    return rgb
end
