#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
_grp = (group player);
if(steamid == (_grp getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grpMembers = _grp getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[4,_grp] remoteExec ["TEX_fnc_updateGang", 2, false];
closeDialog 0;