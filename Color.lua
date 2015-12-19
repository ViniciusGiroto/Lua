-- Created by Squalleze
Hex2ARGB = function(hex)
    if type(hex) == "string" then
        hex = tonumber(hex:gsub("#", ""), 16)
    end

    return {bit32.rshift(hex, 24) % 256, bit32.rshift(hex, 16) % 256, bit32.rshift(hex, 8) % 256, hex % 256}
end

ARGB2HEX = function(alpha, red, green, blue)
    return bit32.bor(blue, bit32.lshift(green, 8), bit32.lshift(red, 16), bit32.lshift(alpha, 24))
end

filter = function(fil, color)
    if type(color) == "string" then
        color = Hex2ARGB(color)
    end

    if fil == "negative" then
        return {color[1], 255 - color[2], 255 - color[3], 255 - color[4]}
    elseif fil == "grayscale" or fil == "greyscale" then
        --lightness
        --local gray = math.floor((math.max(table.unpack(color, 2, 4)) + math.min(table.unpack(color, 2, 4))) / 2)
        --luminosity
        --local gray = math.ceil(.21 * color[2] + .72 * color[3] + .07 * color[4])
        --average : default
        local gray = math.floor((color[2] + color[3] + color[4]) / 3)
        return {color[1], gray, gray, gray}
    end
end
