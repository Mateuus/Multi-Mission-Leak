/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/

private["_unit","_cop"];

_unit = DS_cursorTarget;
_cop = player;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if((side _unit) isEqualTo west) exitWith {}; //Not a civ

hint "Checking suspect...";

[_cop] remoteExec ["DS_fnc_checkChargesPlayer",_unit];