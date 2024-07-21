﻿local AssertionFailure = require "org.ryuu.lunit.AssertionFailure"

return function(expected, actual, messageOrSupplier)
    if expected == actual then
        return
    end

    AssertionFailure.Instantiate()
        :SetMessageOrSupplier(messageOrSupplier)
        :SetExpected(expected)
        :SetActual(actual)
        :Error()
end
