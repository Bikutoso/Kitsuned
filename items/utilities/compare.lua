
--https://github.com/DigitalDetective47/strange-library
local function compare(x, op, y)
    if op == "==" then
        return x == y
    elseif op == "~=" then
        return x ~= y
    elseif op == "<" then
        return x < y
    elseif op == "<=" then
        return x <= y
    elseif op == ">" then
        return x > y
    elseif op == ">=" then
        return x >= y
    else
        sendErrorMessage('invalid operator "' .. op .. '"', "safe_compare")
    end
end


function safe_compare(x, op, y) end

if next(SMODS.find_mod("Talisman")) then
    function safe_compare(x, op, y)
        x = to_big(x)
        y = to_big(y)
        return compare(x, op, y)
    end
else
    function safe_compare(x, op, y)
        x = tonumber(x)
        y = tonumber(y)
        if not x then
            sendErrorMessage("cannot convert parameter x to number", "safe_compare")
        elseif not y then
            sendErrorMessage("cannot convert parameter y to number", "safe_compare")
        end
        return compare(x, op, y)
    end
end
