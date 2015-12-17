-- Created by Squalleze
HEX2ARGB = function(hex)
    if type(hex) == "string" then
        hex = tonumber(hex, 16)
    end

    return {bit32.rshift(hex, 24) % 256, bit32.rshift(hex, 16) % 256, bit32.rshift(hex, 8) % 256, hex % 256}
end

ARGB2HEX = function(alpha, red, green, blue)
    return bit32.bor(blue, bit32.lshift(green, 8), bit32.lshift(red, 16), bit32.lshift(alpha, 24))
end
