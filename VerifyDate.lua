-- Created By Squalleze
verifyDate = function(day, month, year)
    local leapYear = year % 4 == 0 and year % 400 ~= 0
    if month > 0 and month <= 12 then
        local longMounth = month % 2 ~= 0
        if day > 0 and ((month == 2 and ((leapYear and day <= 29) or (not leapYear and day <= 28))) or (month ~= 2 and ((longMounth and day <= 31) or (not longMounth and day <= 30)))) then
            return true
        end
        return "day"
    end
    return "month"
end
