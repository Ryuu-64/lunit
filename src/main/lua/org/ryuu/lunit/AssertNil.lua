local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param actual any
---@param messageOrSupplier string|fun():string
return function(actual, messageOrSupplier)
    if actual == nil then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected("nil")
        :SetActual(actual)
        :Error()
end
