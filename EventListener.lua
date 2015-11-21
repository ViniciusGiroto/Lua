-- Created by Squalleze --
event = {}

addEventListener = function(type, listener)
    type = type:lower()
    event[type] = event[type] or {}
    local typeAmount = 0;

    for k in pairs(event[type]) do
        typeAmount = typeAmount + 1
    end

    event[type]["e" .. (typeAmount + 1)] = listener
    return "e" .. (typeAmount + 1)
end

removeEventListener = function(type, listener)
    event[type:lower()][listener] = nil
end

do
    for i, v in pairs({"ChatCommand", "ColorPicked", "EmotePlayed", "FileLoaded", "FileSaved", "Keyboard", "Loop", "Mouse", "NewGame", "NewPlayer", "PlayerDataLoaded", "PlayerDied", "PlayerGetCheese", "PlayerLeft", "PlayerRespawn", "PlayerVampire", "PlayerWon", "PopupAnswer", "SummoningCancel", "SummoningEnd", "SummoningStart", "TextAreaCallback"}) do
        _G["event" .. v] = function(...)
            for key, value in pairs(event[v:lower()] or {}) do
                value(...)
            end
        end
    end
end
