/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

    Description:
    Returns the gear of the player's dead corpse
*/

private ["_deadBody"];

_deadBody = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _deadBody) exitWith {};

getUnitLoadout _deadBody