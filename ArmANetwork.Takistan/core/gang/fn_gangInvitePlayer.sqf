/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private["_unit"];
disableSerialization;

if((lbCurSel 2632) == -1) exitWith { hint "You have to select a person to invite."; };
_unit = call compile format["%1", lbData[2632,(lbCurSel 2632)]];
if(isNull _unit) exitWith {}; // Again, possible.
if(_unit == player) exitWith {};


if(!isNil {(group _unit) getVariable "gangName"}) exitWith { hint "This player is already in a gang"; };



_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG", _unit getVariable ["realname",name _unit]],
	localize "STR_Gang_Invite_Player",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[_unit, player, (group player)] remoteExecCall ["life_fnc_gangInviteRequest",2];

	hint format["Invite sent to %1", _unit getVariable["realname",name _unit]];
} else {
	hint "Invite cancelled.";
};
