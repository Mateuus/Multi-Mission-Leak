/*
	File: fn_confirmGovPardon.sqf
	Author: Alan
	
	Description:
	Call to confirm a pardon by the governor.
	
	Parameter(s):
	0 - STRING or STRUCTURED TEXT
	1 - OBJECT PLAYER
*/
private["_msg","_gov","_handle"];
_msg = _this select 0;
_gov = _this select 1;

_handle = [_msg] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};

[[player,life_confirm_response],"life_fnc_confirmGovPardonEnd",_gov,false] spawn life_fnc_MP;