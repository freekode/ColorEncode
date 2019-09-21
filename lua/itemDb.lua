ores = {
    'Copper Vein',
    'Tin Vein'
}

herbs = {
    'Peacebloom',
    'Earthroot',
    'Silverleaf',
    'Mageroyal'
}

function isHerb(name)
    for i, elem in ipairs(herbs) do
        if (name == elem) then
            return true
        end
    end

    return false
end

function isOre(name)
    for i, elem in ipairs(ores) do
        if (elem == name) then
            return true
        end
    end

    return false
end
