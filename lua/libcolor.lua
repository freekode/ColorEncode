-- 55.3645
function buildCoordinates(number)
    local parts = {0, 0, 0}

    if number == 0 then
        return parts
    end

    parts.red = tonumber(string.sub(number, 3, 4)) / 100
    parts.green = tonumber(string.sub(number, 5, 6)) / 100
    parts.blue = tonumber(string.sub(number, 7, 8)) / 100

    return parts
end


-- -1.468
function buildPitch(number)
    local parts = {0, 0, 0}

    if number == 0 then
        return parts
    end


    number = number / 10
    if number < 0 then
        parts.red = 1
        number = number * -1
    else
        parts.red = 0
    end

    parts.green = tonumber(string.sub(number, 3, 4)) / 100
    parts.blue = tonumber(string.sub(number, 5, 6)) / 100

    return parts
end


-- 3.05104
function buildAzimyth(number)
    local parts = {0, 0, 0}

    if number == 0 then
        return parts
    end

    number = number / 10

    parts.red = tonumber(string.sub(number, 3, 4)) / 100
    parts.green = tonumber(string.sub(number, 5, 6)) / 100
    parts.blue = tonumber(string.sub(number, 7, 8)) / 100

    return parts
end