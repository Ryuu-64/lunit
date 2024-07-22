---
---@class AssertionFailure
---@field messageOrSupplier string|fun():string
---@field cause string
---@field expected any
---@field actual any
local AssertionFailure = {}
AssertionFailure.__index = AssertionFailure

function AssertionFailure.Instantiate()
    ---@type AssertionFailure
    local instance = {}
    setmetatable(instance, AssertionFailure)
    instance.messageOrSupplier = nil
    instance.cause = nil
    instance.expected = nil
    instance.actual = nil
    return instance
end

function AssertionFailure:SetMessageOrSupplier(messageOrSupplier)
    self.messageOrSupplier = messageOrSupplier
    return self
end

function AssertionFailure:SetCause(cause)
    self.cause = cause
    return self
end

function AssertionFailure:SetExpected(expected)
    self.expected = expected
    return self
end

function AssertionFailure:SetActual(actual)
    self.actual = actual
    return self
end

local function MessageString(messageOrSupplier)
    if type(messageOrSupplier) == "function" then
        return messageOrSupplier()
    end

    return tostring(messageOrSupplier)
end

local function ReasonString(expected, actual)
    if type(actual) == "nil" and type(expected) == "nil" then
        return "nil"
    end
    
    return string.format(
        "expected: <%s> but was: <%s>",
        tostring(expected),
        tostring(actual)
    )
end

local function CauseString(cause)
    return tostring(cause)
end

function AssertionFailure:Error()
    local errorMessages = {}

    local messageString = MessageString(self.messageOrSupplier)
    if messageString ~= "nil" then
        table.insert(errorMessages, string.format("message: %s", messageString))
    end

    local reasonString = ReasonString(self.expected, self.actual)
    if reasonString ~= "nil" then
        table.insert(errorMessages, string.format("reason: %s", reasonString))
    end

    local causeString = CauseString(self.cause)
    if causeString ~= "nil" then
        table.insert(errorMessages, string.format("cause: %s", causeString))
    end

    error(table.concat(errorMessages, ", "))
end

return AssertionFailure
