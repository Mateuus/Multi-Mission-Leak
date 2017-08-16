/*
	ArmA.Network
	Rathbone
	Server Info for Gang Received
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private[];
_group = param [0, grpNull, [grpNull]];
if(!isNull (findDisplay 2620)) then { closedialog 2620; };
hintSilent "Your gang has been disbanded.";
[player] joinSilent (createGroup civilian);
player setVariable["gangRank", -1, true];
deleteGroup _group;
life_gangData = [0,0];
