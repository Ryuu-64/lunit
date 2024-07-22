local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param value any
local function IsType(value)
    if type(value) ~= "string" then
        return false
    end

    if value == "nil" then
        return true
    end

    if value == "number" then
        return true
    end

    if value == "string" then
        return true
    end

    if value == "boolean" then
        return true
    end

    if value == "table" then
        return true
    end

    if value == "function" then
        return true
    end

    if value == "thread" then
        return true
    end

    if value == "userdata" then
        return true
    end

    return false
end

---
---@param expected string nil, number, string, boolean, table, function, thread, userdata
---@param actual string nil, number, string, boolean, table, function, thread, userdata
return function(expected, actual, messageOrSupplier)
    --region try error if expected or actual is not type
    local causes = {}
    if not IsType(expected) then
        table.insert(causes, string.format("invalid expected: <%s>", tostring(expected)))
    end
    if not IsType(actual) then
        table.insert(causes, string.format("invalid actual: <%s>", tostring(actual)))
    end
    if #causes ~= 0 then
        AssertionFailure.Instantiate()
            :SetMessageOrSupplier(messageOrSupplier)
            :SetCause(table.concat(causes, ", "))
            :Error()
    end
    --endregion

    if expected == actual then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected(expected)
        :SetActual(actual)
        :Error()
end
