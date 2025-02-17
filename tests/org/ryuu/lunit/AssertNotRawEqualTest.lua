﻿require "org.ryuu.lunit.InitializeSrcPackagePath"
local AssertNotRawEqual = require "org.ryuu.lunit.AssertNotRawEqual"

local function AssertNotRawEqualWithDifferentObjects()
    AssertNotRawEqual({}, {})
end

local function AssertNotRawEqualWithTableVsNil()
    AssertNotRawEqual({}, nil);
end

local function AssertNotRawEqualWithNilVsTable()
    AssertNotRawEqual(nil, {});
end

local function AssertNotRawEqualWithTwoNil()
    local status, _ = pcall(AssertNotRawEqual, nil, nil)
    if status then
        error("expected not raw equal but was raw equal")
    end
end

local function AssertNotRawEqualWithSameVariable()
    local foo = {}
    local status, _ = pcall(AssertNotRawEqual, foo, foo)
    if status then
        error("expected not raw equal but was raw equal")
    end
end

local function AssertNotRawEqualWithMessage()
    local status, _ = pcall(AssertNotRawEqual, nil, nil, "message")
    if status then
        error()
    end
end

local function AssertNotRawEqualWithMessageSupplier()
    local status, _ = pcall(AssertNotRawEqual, nil, nil, "message supplier")
    if status then
        error()
    end
end

AssertNotRawEqualWithDifferentObjects()
AssertNotRawEqualWithTableVsNil()
AssertNotRawEqualWithNilVsTable()
AssertNotRawEqualWithTwoNil()
AssertNotRawEqualWithSameVariable()
AssertNotRawEqualWithMessage()
AssertNotRawEqualWithMessageSupplier()
