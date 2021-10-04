local ffi = require("ffi")
local isWindows = ffi.os == "Windows"

local backend = isWindows and require("backend.windows")
if not backend then error("Unsupported os used.") end

local restkgll = {}

restkgll.GetFocusedWindow = backend.GetFocusedWindow

return restkgll