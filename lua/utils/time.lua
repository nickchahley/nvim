local M = {}

local function getMinutes(hours, minutes) return (hours*60)+minutes end

local function IsTimeBetween(StartH, StartM, StopH, StopM, TestH, TestM)
	if (StopH < StartH) then -- add 24 hours if endhours < starthours
		local StopHOrg=StopH
		StopH = StopH + 24
		if (TestH <= StopHOrg) then
			-- if endhours has increased the currenthour should also increase
			TestH = TestH + 24
		end
	end

	local StartTVal = getMinutes(StartH, StartM)
	local StopTVal = getMinutes(StopH, StopM)
	local curTVal = getMinutes(TestH, TestM)
	return (curTVal >= StartTVal and curTVal <= StopTVal)
end

local function IsNowBetween(StartH,StartM,StopH,StopM)
	local time = os.date("*t")
	return IsTimeBetween(StartH, StartM, StopH, StopM, time.hour, time.min)
end

function M.is_night(Start, Stop)
	-- TODO adjust start/stop based on date/season
	Start = Start or 18
	Stop  = Stop  or 7
	return IsNowBetween(Start, 0, Stop, 0)
end

return M
