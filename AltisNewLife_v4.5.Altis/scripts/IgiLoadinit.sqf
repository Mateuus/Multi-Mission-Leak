waitUntil {!isnil "bis_fnc_init"};
waitUntil { time > 0 };
IL_EV_Count = 0;
IL_Veh_Array = [];
uiSleep (random 30);
_null = [Player] execVM "scripts\IgiLoad.sqf";
waitUntil {scriptDone _null};
uiSleep (random (IL_Check_Veh_Max - IL_Check_Veh_Min));
{
	if ((typeOf _x) in (IL_Supported_Vehicles_All)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] execVM "scripts\IgiLoad.sqf";
		waitUntil {scriptDone _null};
	};
} forEach (vehicles);
while {true} do
{
	uiSleep (IL_Check_Veh_Min + (random (IL_Check_Veh_Max - IL_Check_Veh_Min)));
	{
		if !(_x in vehicles) then
		{
			IL_Veh_Array = IL_Veh_Array - [_x];
		};
	} forEach (IL_Veh_Array);
	{
		if (((typeOf _x) in (IL_Supported_Vehicles_All)) && !(_x in IL_Veh_Array)) then
		{
			IL_Veh_Array = IL_Veh_Array + [_x];
			_null = [_x] execVM "scripts\IgiLoad.sqf";
			waitUntil {scriptDone _null};
		};
	} forEach (vehicles);
};