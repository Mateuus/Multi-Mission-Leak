/*
	File: fn_robReceive.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = param [0,0,[0]];
if(_cash == 0) exitWith {titleText["Es gab kein Geld...","PLAIN"]};

dwf_cash = dwf_cash + _cash;
titleText[format["Du hast %1€ gestohlen.",[_cash] call DWEV_fnc_numberText],"PLAIN"];
[] call SOCK_fnc_updateRequest;
[0] call SOCK_fnc_updatePartial;