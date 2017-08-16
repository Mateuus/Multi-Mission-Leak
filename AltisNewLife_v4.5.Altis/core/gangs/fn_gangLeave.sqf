#include <macro.h>
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
SUB(_grpMembers,[steamid]);
_grp SVAR["gang_members",_grpMembers,true];
//[player] joinSilent (createGroup civilian);
//[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
[[4,_grp,player],"TON_fnc_updateGang",false,false] call life_fnc_MP;
closeDialog 0;