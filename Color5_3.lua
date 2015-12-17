-- Created by Squalleze
HEX2ARGB = function(hex)
    if type(hex) == "string" then
        hex = tonumber(hex, 16)
    end

    return {hex >> 24 & 255, hex >> 16 & 255, hex >> 8 & 255, hex & 255}
end

ARGB2HEX = function(alpha, red, green, blue)
    return (blue or 0) | (green or 0) << 8 | (red or 0) << 16 | (alpha or 0) << 24
end
