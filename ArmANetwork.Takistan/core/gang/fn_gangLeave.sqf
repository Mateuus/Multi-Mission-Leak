/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_grp", "_grpMembers"];

if (getPlayerUID player == ((group player) getVariable "gangLeader")) exitWith { hint "The gang leader can not simply leave the gang!"; };

[player] joinSilent (createGroup civilian);

[player] remoteExecCall ["life_fnc_gangLeaveRequest",2];
closeDialog 0;
