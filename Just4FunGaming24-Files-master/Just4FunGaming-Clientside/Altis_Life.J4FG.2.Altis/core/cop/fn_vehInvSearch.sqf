/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Searches the vehicle for illegal items.
*/
private["_vehicle", "_vehicleInfo", "_value"];

_vehicle = cursorTarget;
if( isNull _vehicle ) exitWith {};

if( !(_vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _vehicle isKindOf "LandVehicle") ) exitWith {};

_vehicleInfo = _vehicle getVariable ["trunk", []];
if( count _vehicleInfo == 0 ) exitWith {
    hint localize "STR_Cop_VehEmpty"
};

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;

    _config = [ _var ] call XY_fnc_itemConfig;
	if( _config select 5 ) then	{
		if( _config select 4 > 0) then {
			_value = _value + (((_config select 4) * 0.5) * _val);
		};
	};
} forEach (_vehicleInfo select 0);

if( _value < 1 ) exitWith {
    hint localize "STR_Cop_NoIllegalVeh";
};

[0, format[ localize "STR_NOTF_VehContraband", [_value] call XY_fnc_numberText]] remoteExec [ "XY_fnc_broadcast"];

[getPlayerUID player, 2, format ["Hat %1€ für beschlagnahmte Items aus %2 @ %3", [_value] call XY_fnc_numberText, _vehicle, mapGridPosition player]] remoteExec ["XYDB_fnc_log", XYDB];
XY_CA = XY_CA + _value;
[0] call XY_fnc_updatePartial;

_vehicle setVariable["trunk", [], true];