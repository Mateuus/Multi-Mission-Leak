/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Kicks the selected player from the gang
*/

private ["_myGang","_gangName"];

_gangName = (group player) getVariable ["gangName",""];
if(_gangName isEqualTo "")exitwith{};
[[(group player),player],"Hunt_fnc_removePlayer",false,false] spawn BIS_fnc_MP;
hint format ["You have been kicked out of %1.",(group player) getVariable "gangName"];
[player] joinSilent (createGroup civilian);
closeDialog 0;

























