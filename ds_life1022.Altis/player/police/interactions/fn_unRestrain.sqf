/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unrestrains target
*/

private ["_unit","_policeGroup","_oldGroup"];

_unit = DS_cursorTarget;

if((isNull _unit)||(!(_unit getVariable["restrained",FALSE])))exitwith{};

_unit setVariable["restrained",FALSE,TRUE];

if(playerSide isEqualTo west)then
	{
	[0,format["%2 has unrestrained %1",_unit getVariable["name",name _unit],profileName]] remoteExecCall ["DS_fnc_globalMessage",west];
	}
	else
	{
	[0,format["Security Contractor %2 has unrestrained %1",_unit getVariable["name",name _unit],profileName]] remoteExecCall ["DS_fnc_globalMessage",west];
	};