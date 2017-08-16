#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
//if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

// _grp = grpPlayer;
// _grpMembers = grpPlayer getVariable "gang_members";
// _grpMembers = _grpMembers - [steamid];
// _grp setVariable["gang_members",_grpMembers,true];

_grp = (group player);
_unitID = getPlayerUID player;
if(_unitID == (_grp getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
_members = _grp getVariable "gang_members";
if(isNil "_members") exitWith {diag_log "_members not exist"};
if(typeName _members != "ARRAY") exitWith {diag_log "_members not array"};
_members = _members - [_unitID];
_grp setVariable["gang_members",_members,true];
[[4,_grp],"TON_fnc_updateGang",false,false] call lhm_fnc_mp;
[player] joinSilent (createGroup civilian);
lhm_gangData = []; // LHM
closeDialog 0;
Hint "Du hast die Gang verlassen";
