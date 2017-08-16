/*
	File: fn_addAction.sqf
	Author: ColinM
	
	Description: Broadcast an action over the server.
*/
private["_object","_msgTitle","_scriptExec"];
_object = _this select 0;
_msgTitle = _this select 1;
_scriptExec = _this select 2;

if(isNull _object) exitWith {};

_object addaction [_msgTitle,_scriptExec];