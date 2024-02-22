local M = {}

M.live_server_toggle = function(isOff)
	if isOff == true then
		require("live-server").start()
	else
		require("live-server").stop()
	end
end

return M
