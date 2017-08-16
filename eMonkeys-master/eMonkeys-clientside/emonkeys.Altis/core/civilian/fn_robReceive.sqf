/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash == 0) exitWith {titleText["They didn't have any cash..","PLAIN"]};

EMonkeys_c164 = EMonkeys_c164 + _cash;
titleText[format["Du hast %1€ gestohlen",[_cash] call EMonkeys_fnc_numberText],"PLAIN"];
[0] call SOCK_fnc_updatePartial;