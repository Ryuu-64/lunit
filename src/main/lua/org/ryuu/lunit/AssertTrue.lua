local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param condition boolean
---@param messageOrSupplier string
return function(condition, messageOrSupplier)
    if condition then
        return
    end
    
    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected(true)
        :SetActual(false)
        :Error()
end
