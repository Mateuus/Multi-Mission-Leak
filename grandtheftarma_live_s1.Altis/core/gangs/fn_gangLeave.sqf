#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
grpPlayer setVariable["gang_members",_grpMembers,true];

[[grpPlayer,player],"TON_fnc_leaveGang",false,false] call GTA_fnc_remoteExec;

closeDialog 0;