/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_grp", "_grpMembers"];
if ((getPlayerUID player) isEqualTo ((group player) getVariable "gangLeader")) exitWith {hintSilent "The gang leader can not simply leave the gang!";};
closeDialog 0;
[player] joinSilent (createGroup civilian);
[player,(getPlayerUID player)] remoteExecCall ["life_fnc_gangLeaveRequest",2];
player setVariable["gangRank",-1,true];
life_gangData = [0,0];
