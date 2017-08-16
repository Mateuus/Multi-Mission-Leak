
{
	if (_x getVariable ["signal",0] > 0) then
	{
		[_x,_x getVariable "signal"] spawn life_fnc_turnSignal;
	};
} forEach (allMissionObjects "Car");