/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns the actual group of a gang
*/

if((getPlayerUID player) != (_this select 1))exitwith{};
[[true,(group player)],"DS_civ_gangJoin",(_this select 0),false] spawn BIS_fnc_MP;