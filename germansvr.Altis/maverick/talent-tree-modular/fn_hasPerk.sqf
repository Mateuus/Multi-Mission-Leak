scriptName "fn_hasPerk";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_hasPerk.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_hasPerk.sqf"

params ["_arr","_toFind"];

_found = false;
_value = false;
{
    private _first = _x param[0];
    if (_first isEqualType []) then {
        if (_first select 1) then {
            if (_first param[0] isEqualTo _toFind) then {
                _found = true;
                _value = true;
            } else {
                [_x param[1], _toFind] call mav_ttm_fnc_hasPerk;
            };
        };
    } else {
        if (_first isEqualTo _toFind) then {
            _found = true;
            _value = _x param[1];
        };
    };
    if (_found) exitWith {};
    true
} count +_arr;
_value