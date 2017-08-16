/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Alerts players when a rebel attempts to capture KOS while they own it
*/

private ["_group","_base"];

if(!(playerSide isEqualTo civilian))exitWith{};

_group = shawn1 getVariable ["gangOwner",grpNull];
if(_group != (group player)) exitWith {};

_base = [] call DS_fnc_getPlayerBase;
if(isNull _base)exitwith{};
if(!(_base getVariable ["baseKos",false]))exitWith{};

hint "A Rebel is attempting to capture the KOS capture point";
systemChat "A Rebel is attempting to capture the KOS capture point";
titleText ["A Rebel is attempting to capture the KOS capture point","PLAIN"];
player say3D "fail";