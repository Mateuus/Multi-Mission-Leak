// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

diag_log format["RR %1", _this];

private _cash = param [ 0, 0, [0] ];

if( _cash == 0 ) exitWith {
    titleText[ localize "STR_Civ_RobFail", "PLAIN"];
};

XY_CC = XY_CC + _cash;
[0] call XY_fnc_updatePartial;

titleText[ format[localize "STR_Civ_Robbed", [_cash] call XY_fnc_numberText], "PLAIN" ];