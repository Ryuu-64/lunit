﻿local AssertTrue = require "org.ryuu.lunit.AssertTrue"
local AssertFalse = require "org.ryuu.lunit.AssertFalse"
local AssertNil = require "org.ryuu.lunit.AssertNil"
local AssertNotNil = require "org.ryuu.lunit.AssertNotNil"
local AssertEqual = require "org.ryuu.lunit.AssertEqual"
local AssertNotEqual = require "org.ryuu.lunit.AssertNotEqual"

--TODO
--AssertRawEqual
--AssertNotRawEqual
--AssertType
--AssertNotType
--AssertTableEqual
local Assertions = {}

local assertResults = {}

function Assertions.AssertEqual(expected, actual, messageOrSupplier)
    local status, error = pcall(AssertEqual, expected, actual, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

function Assertions.AssertNotEqual(unexpected, actual, messageOrSupplier)
    local status, error = pcall(AssertNotEqual, unexpected, actual, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

function Assertions.AssertTrue(condition, messageOrSupplier)
    local status, error = pcall(AssertTrue, condition, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

function Assertions.AssertFalse(condition, messageOrSupplier)
    local status, error = pcall(AssertFalse, condition, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

function Assertions.AssertNil(actual, messageOrSupplier)
    local status, error = pcall(AssertNil, actual, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

function Assertions.AssertNotNil(actual, messageOrSupplier)
    local status, error = pcall(AssertNotNil, actual, messageOrSupplier)
    table.insert(assertResults, { status = status, error = error })
    return status, error
end

local function analyzeResults(results)
    local totalCount = #results
    local failedCount = 0
    local errorMessages = {}

    for _, result in ipairs(results) do
        if not result.status then
            failedCount = failedCount + 1
            table.insert(errorMessages, result.error)
        end
    end

    return totalCount, failedCount, errorMessages
end

local function displayResults(totalCount, failedCount)
    if totalCount == 1 then
        print(string.format("%d test completed, %d failed", totalCount, failedCount))
        return
    end

    print(string.format("%d tests completed, %d failed", totalCount, failedCount))
end

local function concatenateErrorMessages(errorMessages)
    local errorMessage = ""
    for i, msg in ipairs(errorMessages) do
        errorMessage = errorMessage .. "\n" .. i .. ". " .. msg
    end
    return errorMessage
end

function Assertions.Result()
    local totalCount, failedCount, errorMessages = analyzeResults(assertResults)

    displayResults(totalCount, failedCount)

    if failedCount > 0 then
        local errorMessage = concatenateErrorMessages(errorMessages)
        assertResults = {}
        error(errorMessage)
    end

    assertResults = {}
end

return Assertions
