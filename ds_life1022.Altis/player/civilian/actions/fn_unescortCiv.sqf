/*
	Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Stops escorting target
*/

private ["_unit"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit getVariable ["escorted",false])) exitWith {systemchat "This player is not being escorted"};

detach _unit;
_unit setVariable["escorted",false,true];