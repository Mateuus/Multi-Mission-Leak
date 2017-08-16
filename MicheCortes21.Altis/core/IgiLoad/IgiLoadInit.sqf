if (isServer || isDedicated) exitWith {};

private["_side","_admin","_path"];

_side = player getVariable ["side",""];
_admin = player getVariable "adminlvl";
_path = "";

//if(_side != "adac" && !(_myUID in _allowUID) && _admin == 0) exitWith {};

waituntil {!isnil "bis_fnc_init"};
waitUntil { time > 0 };

IL_EV_Count = 0;
IL_Veh_Array = [];

systemChat "Logistiksystem wird geladen, bitte warten...";
sleep (random 30);

if((_side == "Independent")) then {
	_path = "core\igiload\IgiLoadFARA.sqf";
} else {
	_path = "core\igiload\IgiLoadCiv.sqf";
};

_null = [Player] execVM _path;
waitUntil {scriptDone _null};
	
sleep (random (IL_Check_Veh_Max - IL_Check_Veh_Min));

{
	if ((typeOf _x) in (IL_Supported_Vehicles_All)) then
	{
		IL_Veh_Array = IL_Veh_Array + [_x];
		_null = [_x] execVM _path;
		waitUntil {scriptDone _null};
	};
} forEach (vehicles);

systemChat "Logistiksystem geladen!";

while {true} do 
{
	sleep (IL_Check_Veh_Min + (random (IL_Check_Veh_Max - IL_Check_Veh_Min)));
	
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
			_null = [_x] execVM _path;
			waitUntil {scriptDone _null};
		};
	} forEach (vehicles);
};