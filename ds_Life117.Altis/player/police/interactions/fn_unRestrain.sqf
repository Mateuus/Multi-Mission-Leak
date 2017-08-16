/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	unRestrains target
*/
private ["_civ"];

_civ = DS_cursorTarget;

if((isNull _civ)||((!(_civ getVariable["cuffed",FALSE]))&&(!(_civ getVariable["ziptied",FALSE]))))exitWith {};

_civ setVariable["cuffed",FALSE,TRUE];
_civ setVariable["Escorted",FALSE,TRUE];
_civ setVariable["cuffedVeh",FALSE,TRUE];
_civ setVariable["ziptied",FALSE,TRUE];
detach _civ;

if(playerside == west)then
	{
	[[0,format["%2 has unrestrained %1",_civ getVariable["name",name _civ],profileName]],"DS_fnc_globalMessage",west,FALSE] call BIS_fnc_MP;
	}
	else
	{
	[[0,format["Security Contractor %2 has unrestrained %1",_civ getVariable["name",name _civ],profileName]],"DS_fnc_globalMessage",west,FALSE] call BIS_fnc_MP;
	};