/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unrestrains a civilian
*/

private["_unit"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if((isNull _unit)||(!(_unit getVariable["restrained",FALSE])))exitwith{};
if(((player inArea "safezone")||(player inArea "safezone_1"))&&(playerSide isEqualTo civilian))exitwith{hint "You can't unrestrain people in a safe zone";};

_unit setVariable["restrained",FALSE,TRUE];

hint format ["You have unrestrained %1",(name _unit)];