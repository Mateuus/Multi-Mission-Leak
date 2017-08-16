/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Stops escorting target
*/
private ["_civ"];


_civ = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _civ) exitWith {};
if(!(_civ getVariable ["escorted",false])) exitWith {systemchat "un-escort failed"};
if(side _civ != civilian) exitWith {};
if(isNull _civ) exitWith {};
detach _civ;
_civ setVariable["escorted",false,true];






