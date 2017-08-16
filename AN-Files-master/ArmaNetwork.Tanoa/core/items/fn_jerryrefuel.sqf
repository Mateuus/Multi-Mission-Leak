/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorObject;
life_interrupted = false;
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

if(!(["fuelFull",1] call life_fnc_virtualItemRemove)) exitWith {};
life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
//Setup our progress bar.
disableSerialization;
_progressBar = [] call life_fnc_tufruxatra;
_progress = _progressBar select 1;
_progressText = _progressBar select 2;
_progressText ctrlSetText format ["%1",_upp];
_anim = ["medic"] call life_fnc_yufanuyaw;
_waitTime = (10 / (1 / 0.006));

for [{_i = 0},{_i < 1},{_i = _i + 0.006}] do {
	_progress progressSetPosition _i;
	sleep _waitTime;
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(player distance _vehicle > 6) exitWith {};
	if(life_interrupted) exitWith {};
};

[false] call life_fnc_tufruxatra;
terminate _anim;
player playActionNow "stop";
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
if(player distance _vehicle > 6) exitWith {titleText[localize "STR_NOTF_ActionCancel","PLAIN"];life_action_inUse = false;};

life_action_inUse = false;

switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.5] remoteExecCall ["setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.5);
		};
	};

	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.2] remoteExecCall ["setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.2);
		};
	};

	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.35] remoteExecCall ["setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];
["fuelEmpty",1] call life_fnc_virtualItemAdd;
