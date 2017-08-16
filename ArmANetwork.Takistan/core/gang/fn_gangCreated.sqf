#include <macro.h>
/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];

_group = param [0, grpNull,[grpNull]];

SUB(BANK,7500);

life_action_gangInUse = nil;
[player] join _group;
_group selectLeader player;
player setRank "COLONEL";

hint "Your gang has been created.";
