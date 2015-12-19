-- Created by Squalleze
Hex2ARGB = function(hex)
    if type(hex) == "string" then
        hex = tonumber(hex:gsub("#", ""), 16)
    end

    return {hex >> 24 & 255, hex >> 16 & 255, hex >> 8 & 255, hex & 255}
end

ARGB2Hex = function(alpha, red, green, blue)
    return (blue or 0) | (green or 0) << 8 | (red or 0) << 16 | (alpha or 0) << 24
end

filter = function(fil, color)
    if type(color) == "string" then
        color = Hex2ARGB(color)
    end

    if fil == "negative" then
        return {color[1], 255 - color[2], 255 - color[3], 255 - color[4]}
    elseif fil == "grayscale" or fil == "greyscale" then
        --lightness
        --local gray = (math.max(table.unpack(color, 2, 4)) + math.min(table.unpack(color, 2, 4))) // 2
        --luminosity
        --local gray = math.ceil(.21 * color[2] + .72 * color[3] + .07 * color[4])
        --average : default
        local gray = (color[2] + color[3] + color[4]) // 3
        return {color[1], gray, gray, gray}
    end
end
