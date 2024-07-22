local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

return function(unexpected, actual, messageOrSupplier)
    if not rawequal(unexpected, actual) then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected("not " .. tostring(unexpected))
        :SetActual(actual)
        :Error()
end
