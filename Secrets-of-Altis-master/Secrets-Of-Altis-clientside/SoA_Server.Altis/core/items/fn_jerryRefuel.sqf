/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorTarget;
life_interrupted = false;
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 6) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

if(!([false,"fuelF",1] call life_fnc_handleInv)) exitWith {};
life_action_inUse = true;
closedialog 0;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_sleep = 0.195;
_cP = 0.01;
_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];

_handle = [_upp,_sleep,_cP,"AinvPknlMstpsnonWnonDnon_medic_1",_vehicle,12] spawn life_fnc_processBar;
WaitUntil{scriptDone _handle};
if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false; life_action_inUse = false;};
if(life_process_bad) exitWith {life_process_bad = false; life_action_inUse = false; life_interrupted = false;};

life_action_inUse = false;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			[_vehicle,(Fuel _vehicle) + 0.5] remoteExecCall ["life_fnc_setFuel",_vehicle];
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
			[_vehicle,(Fuel _vehicle) + 0.2] remoteExecCall ["life_fnc_setFuel",_vehicle];
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
			[_vehicle,(Fuel _vehicle) + 0.35] remoteExecCall ["life_fnc_setFuel",_vehicle];
		}
			else
		{
			_vehicle setFuel ((Fuel _vehicle) + 0.35);
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];
[true,"fuelE",1] call life_fnc_handleInv;