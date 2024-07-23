local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

return function(unexpected, actual, messageOrSupplier)
    if not rawequal(unexpected, actual) then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetIsExpected(false)
        :SetExpected(unexpected)
        :SetActual(actual)
        :Error()
end
