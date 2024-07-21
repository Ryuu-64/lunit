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
