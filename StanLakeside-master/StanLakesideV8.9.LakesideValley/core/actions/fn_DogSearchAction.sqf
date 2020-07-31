/*
	File: fn_searchAction.sqf
	
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};

if(isplayer cursorTarget) then {
	remoteExec ["fnc_searched",cursorTarget];
};