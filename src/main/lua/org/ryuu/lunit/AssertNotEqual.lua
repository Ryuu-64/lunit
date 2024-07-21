local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param unexpected any
---@param actual any
---@param messageOrSupplier string|fun():string
return function(unexpected, actual, messageOrSupplier)
    if unexpected ~= actual then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected("not " .. tostring(unexpected))
        :SetActual(actual)
        :Error()
end
