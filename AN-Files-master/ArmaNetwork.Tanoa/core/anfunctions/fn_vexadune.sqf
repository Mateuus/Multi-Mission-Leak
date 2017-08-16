/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/

_player = param [_this,0,ObjNull,[ObjNull]];
_group = param [_this,1,grpNull,[grpNull]];
if (player != _player && {_group != grpNull}) then {
	_group selectLeader _player;
	//_player setRank "COLONEL";
};
