waituntil {!isnil "bis_fnc_init"};

waitUntil { time > 0 };

IL_EV_Count = 0;
IL_Veh_Array = [];

cutText ["","PLAIN",2];
uisleep (random 30);


_null = [Player] spawn Emonkeys_fnc_IgiLoad_start;
waitUntil {scriptDone _null};

uisleep (random (IL_Check_Veh_Max - IL_Check_Veh_Min));

{
	if ((typeOf _x) in (IL_Supported_Vehicles_All)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] spawn Emonkeys_fnc_IgiLoad_start;
		waitUntil {scriptDone _null};
	};
} forEach (vehicles);

cutText ["","PLAIN",2];

while {true} do 
{
	uisleep (IL_Check_Veh_Min + (random (IL_Check_Veh_Max - IL_Check_Veh_Min)));
	
	//Delete vehicles from "IL_Veh_Array" if not in "vehicles"
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
			_null = [_x] spawn Emonkeys_fnc_IgiLoad_start;
			waitUntil {scriptDone _null};
		};
	} forEach (vehicles);
};
