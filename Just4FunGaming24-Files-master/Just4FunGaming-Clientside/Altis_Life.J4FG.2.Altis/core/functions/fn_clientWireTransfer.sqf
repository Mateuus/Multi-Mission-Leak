// File: fn_clientWireTransfer.sqf
private[ "_unit", "_val", "_from" ];
_val =  [ _this, 0, -1, [-1] ] call BIS_fnc_param;
_from = [ _this, 1, "", [""] ] call BIS_fnc_param;

if( _val < 0 ) exitWith {};
if( _from isEqualTo "" ) exitWith {};

XY_CA = XY_CA + _val;
[0] call XY_fnc_updatePartial;

hint format["%1 hat %2€ an dich überwiesen", _from, [_val] call XY_fnc_numberText];
[getPlayerUID player, 1, format ["Hat von %1 (%2) %3€ per Überweisung erhalten", name _from, getPlayerUID _from, [_val] call XY_fnc_numberText ]] remoteExec ["XYDB_fnc_log", XYDB];