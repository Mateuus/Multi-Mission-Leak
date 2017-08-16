private ["_unit"];
disableSerialization;

if (lbCurSel 2632 == -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format ["%1", lbData [2632, lbCurSel 2632]];
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};
if (!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "This player is already in a gang"};

//--- Check gang member limit
if (count (group player getVariable ["gang_members", 8]) == (group player getVariable ["gang_maxMembers", 8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
	format [localize "STR_GNOTF_InvitePlayerMSG", _unit getVariable ["nametag_title", name _unit]],
	localize "STR_Gang_Invite_Player",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	[[profileName, group player], "life_fnc_gangInvite", _unit] call GTA_fnc_remoteExec;
	hint format [localize "STR_GNOTF_InviteSent", _unit getVariable ["nametag_title", name _unit]];
} else {
	hint localize "STR_GNOTF_InviteCancel";
};
