// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _vehicle = param[0, objNull, [objNull]];
if( isNull _vehicle ) exitWith { [0, 0] };

private _config = [typeOf _vehicle, _vehicle getVariable ["side", playerSide]] call XY_fnc_vehicleConfig;
private _maxWeight = 0;

if( !(_config isEqualTo []) ) then {
    _maxWeight = _config select 2;
};

[_maxWeight, (_vehicle getVariable ["trunk", [[], 0]]) select 1];