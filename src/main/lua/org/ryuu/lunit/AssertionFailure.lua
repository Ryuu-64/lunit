---
---@class AssertionFailure
---@field messageOrSupplier table object
---@field cause table Throwable
---@field expected table object
---@field actual table object
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
    return string.format(
        "expected: <%s> but was: <%s>",
        tostring(expected),
        tostring(actual)
    )
end

function AssertionFailure:Error()
    local errorMessages = {}

    local message = MessageString(self.messageOrSupplier)
    if message ~= "nil" then
        table.insert(errorMessages, string.format("message: %s", message))
    end

    local reason = ReasonString(self.expected, self.actual)
    table.insert(errorMessages, string.format("reason: %s", reason))

    error(table.concat(errorMessages, ", "))
end

return AssertionFailure
