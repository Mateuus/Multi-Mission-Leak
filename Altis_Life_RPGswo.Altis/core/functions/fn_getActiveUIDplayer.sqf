/*
	File: fn_isUIDActive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sees if the UID passed to it is in the server.
	
	Returns:
	Player Object
*/
private["_uid","_ret"];
_uid = param [0,"",[""]];
if(_uid == "") exitWith {false}; //Bad UID
_ret = ObjNull;
{
	if(getPlayerUID _x == _uid) exitWith {_ret = _x;};
	false;
} count playableUnits;

_ret;