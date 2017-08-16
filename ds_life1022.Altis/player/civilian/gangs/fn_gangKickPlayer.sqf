/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Kicks the player from their current gang
*/

params [["_fullKick",true,[false]]];

private _group = (group player);
private _gangName = _group getVariable ["gangName",""];
if(_gangName isEqualTo "")exitWith{};

if(_fullKick)then{[_group,_gangName,player] remoteExec ["HUNT_fnc_removePlayer",2];};
hint format ["You have been kicked out of %1",_gangName];

[player] joinSilent (createGroup civilian);

if(player distance spawnIsland > 2000)then{closeDialog 0;};