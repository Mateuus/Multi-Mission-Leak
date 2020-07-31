#include <macro.h>
/*
	
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid isEqualTo (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[4,_grp] remoteExecCall ["TON_fnc_updateGang",(call life_fnc_HCC)];
closeDialog 0;