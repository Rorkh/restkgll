local ffi = require("ffi")

local sizeof = ffi.sizeof
local C = ffi.C

require("backend.windows.cdefs")

local window = {}

function window:GetTitleInternal()
	local title = ffi.new("char[256]")
	C.GetWindowTextA(self.hwnd, title, 256)
	return ffi.string(title, 256)
end

function window:GetWindowRectInternal()
	local rect = ffi.new("RECT")
	C.GetWindowRect(self.hwnd, rect)
	return rect.left, rect.top, (rect.right - rect.left), (rect.bottom - rect.top)
end

function window:initialize(hwnd)
	local obj = {}
	
	self.hwnd = hwnd

	self.title = self:GetTitleInternal()
	self.x, self.y, self.w, self.h = window:GetWindowRectInternal()

	setmetatable(obj, {__index = window})
	return obj
end

function window:GetTitle()
	return self.title
end

function window:GetPosition()
	return self.x, self.y
end

function window:GetSize()
	return self.w, self.x
end

setmetatable(window, {__call = window.initialize})

return window