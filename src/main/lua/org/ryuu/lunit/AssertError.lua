local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

---
---@param errorFunction fun(any:any):any
return function(errorFunction, messageOrSupplier)
    local typeOfErrorFunction = type(errorFunction)
    if typeOfErrorFunction ~= "function" then
        local cause = string.format(
            "expected type: <function> but was: <%s>",
            typeOfErrorFunction
        )
        AssertionFailure.Instantiate()
            :SetMessageOrSupplier(messageOrSupplier)
            :SetCause(cause)
            :Error()
    end

    local status, _ = pcall(errorFunction)
    if not status then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetCause("expected an error, but no error was produced")
        :Error()
end
