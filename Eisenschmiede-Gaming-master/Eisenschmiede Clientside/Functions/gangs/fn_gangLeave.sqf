#include "..\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers","_member"];
if(EQUAL(getPlayerUID player,(group player getVariable "gang_owner"))) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = group player;
_grpMembers = group player getVariable "gang_members";
_grpMembers = _grpMembers - [getPlayerUID player];
_grp setVariable ["gang_members",_grpMembers,true];

[[player,group player],"ES_fnc_clientGangLeft",_unit,false] call ES_fnc_MP; 
[4,_grp] remoteExec ["ES_fnc_updateGang",2];
closeDialog 0;