/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_name","_group"];

_group = param [0,grpNull,[grpNull]];
_name = param [1, "", [""]];

if(!isNil {(group player) getVariable "gangName"}) exitWith { hintSilent "You are already in a gang"; };

_gangName = _group getVariable "gangName";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[player, _group] remoteExecCall ["life_fnc_gangJoin",2];
} else {
	hintSilent "You have rejected the invitation.";
};
