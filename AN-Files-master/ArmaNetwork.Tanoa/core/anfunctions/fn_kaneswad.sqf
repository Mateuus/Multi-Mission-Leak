/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
params [
	["_unit",objNull,[objNull]]
];
disableSerialization;
if(isNull _unit) exitWith {};
if(_unit isEqualTo player) exitWith {};
if(!alive _unit) exitWith {};
if(player distance _unit > 5) exitWith {};
if(!isNil {(group _unit) getVariable "gangName"}) exitWith {hintSilent "This player is already in a gang";};
_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invite_Player",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if(_action) then {
	[_unit,player,(group player)] remoteExecCall ["life_fnc_gangInviteRequest",2];
	hintSilent format["Invite sent to %1", _unit getVariable["realname",name _unit]];
} else {
	hintSilent "Invite cancelled.";
};
