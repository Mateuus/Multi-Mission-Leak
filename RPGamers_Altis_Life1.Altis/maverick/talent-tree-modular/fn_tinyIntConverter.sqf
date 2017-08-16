scriptName "fn_tinyIntConverter";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_tinyIntConverter.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_tinyIntConverter.sqf"

{
    private _first = _x param[0];
    if (_first isEqualType []) then {
        _first set [1, [_first param [1]] call mav_ttm_fnc_boolScalar];
        (_x param[1]) call mav_ttm_fnc_tinyIntConverter;
    } else {
        _x set [1, [_x param [1]] call mav_ttm_fnc_boolScalar];
    };
    true
} count _this;