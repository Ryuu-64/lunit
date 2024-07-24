local mainPath = "..\\..\\main\\lua\\?.lua"
package.path = package.path .. ";" .. mainPath

local Assertions = require "org.ryuu.lunit.Assertions"

local status, results

--region 1 test completed, 1 failed
Assertions.AssertEqual(nil, nil)
Assertions.Result()
--endregion

--region 1 test completed, 1 failed
Assertions.AssertEqual({}, nil)
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 1 test completed, 1 failed
Assertions.AssertNotEqual(37, 37)
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 1 test completed, 0 failed
Assertions.AssertNotEqual(37, 42)
Assertions.Result()
--endregion

local table1 = {}
local table2 = {}
--region 2 tests completed, 1 failed
Assertions.AssertRawEqual(table1, table1)
Assertions.AssertRawEqual(table1, table2)
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 2 tests completed, 1 failed
print("Assertions.AssertNotRawEqual")
Assertions.AssertNotRawEqual(table1, table2)
Assertions.AssertNotRawEqual(table1, table1)
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 1 test completed, 0 failed
Assertions.AssertNotNil({}, "Assertions.AssertNotNil")
Assertions.Result()
--endregion

--region 1 test completed, 1 failed
Assertions.AssertNotNil(nil, "Assertions.AssertNotNil")
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 2 tests completed, 0 failed
Assertions.AssertNil(nil, "Assertions.AssertNil")
Assertions.AssertNotNil({}, "Assertions.AssertNotNil")
Assertions.Result()
--endregion

--region 2 tests completed, 2 failed
Assertions.AssertNil({}, "Assertions.AssertNil")
Assertions.AssertNotNil(nil, "Assertions.AssertNotNil")
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 3 tests completed, 2 failed
Assertions.AssertType(type({}), type({}), "Assertions.AssertType")
Assertions.AssertType(type({}), type(""), "Assertions.AssertType")
Assertions.AssertType({}, {}, "Assertions.AssertType")
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 3 tests completed, 2 failed
Assertions.AssertError("foo", "Assertions.AssertType")
Assertions.AssertError(
    function()
    end,
    "Assertions.AssertType"
)
Assertions.AssertError(
    function()
        error()
    end,
    "Assertions.AssertType"
)
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion

--region 5 tests completed, 4 failed
Assertions.AssertTableEqual(nil, nil)
Assertions.AssertTableEqual(nil, {})
Assertions.AssertTableEqual({ "foo" }, {})
Assertions.AssertTableEqual({ "foo" }, { "bar" })
Assertions.AssertTableEqual({ "foo", "bar" }, { "foo", "bar" })
status, results = pcall(Assertions.Result)
print(status)
print(results)
--endregion
