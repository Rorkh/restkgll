local ffi = require("ffi")
local bit = require("bit")

local C = ffi.C

require("backend.windows.cdefs")

local window = require("backend.windows.window")

local backend = {}

local sizeof = ffi.sizeof
local ffi_new = ffi.new

local GetForegroundWindow = C.GetForegroundWindow

function backend.GetFocusedWindow()
	return window:initialize(GetForegroundWindow())
end

return backend