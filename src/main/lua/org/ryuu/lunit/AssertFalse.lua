local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param condition boolean
---@param messageOrSupplier string
return function(condition, messageOrSupplier)
    if not condition then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected(false)
        :SetActual(true)
        :Error()
end
