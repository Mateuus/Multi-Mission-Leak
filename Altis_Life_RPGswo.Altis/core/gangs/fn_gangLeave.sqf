#include "..\..\macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers","_unitID","_members"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "Du musst den Leader abgeben bevor du die Gang verlassen kannst";};
_unitID = getPlayerUID player;
_members = grpPlayer getVariable "gang_members";

if(isNil "_members") exitWith {};
if(!((typeName _members) == "ARRAY")) exitWith {};
if (player getVariable ["restrained",false]) exitwith {hint "Du kannst die Gang nicht verlassen, wenn du verhaftet bist.";};

{
	if (_unitID IN _x) exitWith {_members deleteAt _forEachIndex};
} forEach _members;

grpPlayer setVariable ["gang_members",_members,true]; 

[_unitID] remoteExec ["DWF_fnc_leaveGang",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];

[player,grpPlayer] remoteExec ["DWF_fnc_clientGangLeft",player];

closeDialog 0;